namespace :get_fact_contact_data do
  desc "retrieve  data from mysql:leads"
  task retrieve_data_leads: :environment do
    puts "Fact_Contact"
    leads = Lead.select ("created_at, company_name, email, project_name")
    puts leads
  end
end