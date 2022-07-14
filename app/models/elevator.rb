class Elevator < ApplicationRecord
    belongs_to :column
    # after_update :test
    after_update :twilio
    
    
    # def test
    #     puts "------------------"
    #     puts "test"
    #     puts "------------------"

    #     account_sid = ENV['TWILIO_ACCOUNT_SID']
    #     auth_token = ENV['TWILIO_AUTH_TOKEN']
    #     @client = Twilio::REST::Client.new(account_sid, auth_token)

    #     message = @client.messages.create(
    #         to: '+14182346159',
    #         from: '++15203416848',
    #         body: 'The status from elevator' {elevator_id} 'in building' {elevator_id.building} 'has changed from' {elevator_id} 'to' {new_elevator_id}     
    #     )
    # end


    def twilio
        if @elevator_status_changed = "Intervention" then 
            
          account_sid = ENV['TWILIO_ACCOUNT_SID']
          auth_token = ENV['TWILIO_AUTH_TOKEN']
          @client = Twilio::REST::Client.new(account_sid, auth_token)
  
          message = @client.messages.create(
              to: '+14182346159',
              from: '+15203416848',
              body: "The status from elevator #{id} in building #{column.battery.building.id} has changed from #{status_before_last_save} to #{status}."
          )
        end
    end
end
