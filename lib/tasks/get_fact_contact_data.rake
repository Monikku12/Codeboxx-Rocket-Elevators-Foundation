namespace :get_fact_contact_data do
  desc "retreive data from mysql:leads"
  task retreive_data_leads: :environment do
    puts "Fact_Contact"
    leads = Lead.select ("created_at, company_name, email, project_name")
    puts leads
  end
end