namespace :fake do
  require "json"

  task data: :environment do
    puts "-----------------------"
    file = File.read(File.join(Rails.root, 'lib', 'addresses.json'))
    data = JSON.parse(file)
    addresses = data["addresses"]

    addresses.each do |address|
      #pp "Address is : #{address["address1"]}"

      user = User.create!(
        email: Faker::Internet.email, 
        password: 'password123', 
      )

      _address = Address.create!(
        type_of_address: ['Business', 'Billing', 'Shipping', 'Home'].sample,
        status: ['Active', 'Inactive'].sample,
        entity: ['Customer', 'Building'].sample,
        number_and_street: address["address1"],
        suite_or_apartment: Faker::Address.secondary_address,
        city: address["city"],
        postal_code: address["postalCode"],
        country: address["state"],
        notes: Faker::Lorem.paragraph(sentence_count: 2),
      )

      customer = Customer.create!(
        company_name: Faker::Company.name,
        address: _address,
        company_contact_full_name: Faker::Name.name,
        company_contact_phone: Faker::PhoneNumber.phone_number,
        company_contact_email: Faker::Internet.email,
        company_description: Faker::Company.industry,
        service_technical_authority_full_name: Faker::Name.name,
        service_technical_authority_phone: Faker::PhoneNumber.phone_number,
        service_technical_manager_email: Faker::Internet.email,
        user: user,
       
      )

        building = Building.create!(  
        #number_and_street: ['AAA'].sample, 
        building_administrator_full_name: Faker::Name.name,
        building_administrator_email: Faker::Internet.email,
        building_administrator_phone: Faker::PhoneNumber.phone_number,
        building_technical_contact_full_name: Faker::Name.name,
        building_technical_contact_email: Faker::Internet.email,
        building_technical_contact_phone: Faker::PhoneNumber.phone_number,
        customer: customer,
        #building_detail: building_detail,
        #battery: battery,
        address: _address,
      )

      building_detail = BuildingDetail.create!(
        key: Faker::Lorem.sentence,
        value: Faker::Lorem.sentence(word_count: 2),
        building: building,
      )
      
      employee = Employee.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        title: Faker::Name.middle_name,
        email: Faker::Internet.email,  
        user: user,
      )

      5.times do
        battery = Battery.create!(
          batterie_type: ["Residential", "Corportate", "Commercial", "Hybrid"].sample,
          status: ["Active", "Inactive", "Intervention"].sample,
          employeeId: ["aaa"].sample,
          commissioning_date: Faker::Date.between(from: '2019-07-06', to: '2020-07-06'),
          last_inspection_date: Faker::Date.between(from: '2019-07-06', to: '2020-07-06'),
          certificate_of_operation: Faker::Lorem.paragraphs,
          informations: Faker::Lorem.paragraphs,
          notes: Faker::Lorem.paragraph(sentence_count: 2),
          building: building,
          employee: employee,
        )

        column = Column.create!(
          column_type: ["Residential", "Corportate", "Commercial", "Hybrid"].sample,
          number_of_floors_served: Faker::Number.between(from:2, to:150),
          status: ["Active", "Inactive", "Intervention"].sample,
          information: Faker::Lorem.paragraphs,
          notes: Faker::Lorem.paragraph(sentence_count: 2),
          battery: battery,
        )
      
        elevator = Elevator.create(
          serial_number: Faker::Number.number(digits: 8),
          model: ["Standard", "premium", "Excelium"].sample,
          elevator_type: ["Residential", "Corportate", "Commercial", "Hybrid"].sample,
          status: ["Active", "Inactive", "Intervention"].sample,
          commissioning_date: Faker::Date.between(from: '2019-07-06', to: '2020-07-06'),
          last_inspection_date: Faker::Date.between(from: '2019-07-06', to: '2020-07-06'),
          inspection_certificate: Faker::Lorem.paragraph,
          information: Faker::Lorem.paragraphs,
          notes: Faker::Lorem.paragraph(sentence_count: 2),
          column: column,
        )
        
      end



      25.times do  
       

        
        lead = Lead.create(
          full_name: Faker::Name.name,
          company_name: Faker::Company.industry,
          email: Faker::Internet.email,
          phone: Faker::PhoneNumber.phone_number,
          project_name: Faker::Lorem.paragraphs,
          project_description: Faker::Lorem.paragraphs,
          department: Faker::Lorem.paragraph(sentence_count: 2),
          message: Faker::Lorem.paragraph(sentence_count: 2),
          file_attachment: ['test'].sample,
          
        )

        quote = Quote.create!(
          building_type: ["Residential", "Corportate", "Commercial", "Hybrid"].sample,
          number_of_apartments: Faker::Number.between(from:40, to:800),
          number_of_floors: Faker::Number.between(from:5, to:100),
          number_of_basement: Faker::Number.between(from:1, to:5),
          number_of_businesses: Faker::Number.between(from:1, to:20),
          number_of_parking_space: Faker::Number.between(from:1, to:350),
          number_of_elevator_cages: Faker::Number.between(from:1, to:20),
          number_of_seperate_tenant_companies: Faker::Number.between(from:1, to:20),
          maximum_number_of_occupants_per_floor: Faker::Number.between(from:80, to:300),
          hours_of_activity: Faker::Number.between(from:1, to:24),
          quality_of_elevator_service: ["Standard", "premium", "Excelium"].sample,
          unit_price_of_each_elevator: Faker::Number.number(digits: 4),
          amount_of_elevator_needed: Faker::Number.between(from:4, to:12),
          total_price_of_the_elevators: Faker::Number.number(digits: 6),
          installation_fees: Faker::Number.number(digits: 3),
          final_price: Faker::Number.number(digits: 7),
          quote_email: Faker::Internet.email,
          compagny_name: Faker::Company.industry,
          
        )  

      end
    end
    #data = JSON.load file
    #pp hash["addresses"]
    puts "-----------------------"
  end
end