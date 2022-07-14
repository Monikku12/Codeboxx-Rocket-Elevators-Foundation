class GooglemapsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        #@test = Building.all


        @test = []
        @test2 = []
        Building.all.each do |b|
            @test.push(
                lat: b.address.latitude,
                lng: b.address.longitude,
                address: b.address.number_and_street,
                customername: b.customer.company_contact_full_name,
                numberofbattery: b.battery_ids.count,
                techcontactname: b.building_technical_contact_full_name,
                numberofcolumns: b.batteries.columns.count,
            )
                        
        end
        puts "-----"
        puts @test
        puts "-----"

    
    end
   
    def googlemapspage
    end

end
