namespace :get_dim_customers_data do
  desc "retrieve  data from mysql:quotes"
  task retrieve_data_customers: :environment do
    puts "Change 'company_description' to 'customer_city'"
    puts "Change 'updated_at' to 'nb_elevator'"
    customers = Customer.select ("created_at, company_name, company_contact_full_name, company_contact_email, company_description")
    puts customers
    customer_elevator = Building.select ('updated_at')
    puts customer_elevator
  end
end