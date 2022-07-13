class Lead < ApplicationRecord
    after_save :Freshdesk
    
# set to private à checker
def Freshdesk  
    Freshdesk::Rest.configure do |config|
    config.api_key = ENV['FRESHDESK_API_KEY']
    config.domain = ENV['FRESHDESK_DOMAIN']
    puts ENV['FRESHDESK_DOMAIN']
    end
  end


  # 
  #   resource = Freshdesk::Rest::Factory.ticket_resource
  #   resource.post(data: { name: "full_name", email: "email", status: 2, priority: 2, source: 2 }).tap do |c|
  #   puts "#{c[:name]} #{c[:email]}"
  # end









end
