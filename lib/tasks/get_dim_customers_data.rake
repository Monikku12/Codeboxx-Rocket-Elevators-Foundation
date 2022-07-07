namespace :get_dim_customers_data do
  desc "retreive data from mysql:quotes"
  task retreive_data_customers: :environment do
    puts "Change 'company_description' to 'customer_city'"
    puts "Change 'updated_at' to 'nb_elevator'"
    customers = Customer.select ("created_at, company_name, company_contact_full_name, company_contact_email, company_description")
    puts customers
    customer_elevator = Building.select ('updated_at')
  end
end