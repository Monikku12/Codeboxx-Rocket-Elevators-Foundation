class Elevator < ApplicationRecord
    belongs_to :column
    after_update :twilio
    
    
    def twilio
        if @elevator_status_changed = "Intervention" then 
            
          account_sid = ENV['TWILIO_ACCOUNT_SID']
          auth_token = ENV['TWILIO_AUTH_TOKEN']
          @client = Twilio::REST::Client.new(account_sid, auth_token)
  
          message = @client.messages.create(
              to: '+14182346159',
              from: '+15203416848',
              body: 'We have trouble ! Come over here !'      
          )
        end
    end
end
