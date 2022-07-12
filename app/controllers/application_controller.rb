class ApplicationController < ActionController::Base

    puts "----------------------"
    puts ENV["TWILIO_ACCOUNT_SID"]
    puts ENV["TWILIO_AUTH_TOKEN"]
    puts "----------------------"
   

end
