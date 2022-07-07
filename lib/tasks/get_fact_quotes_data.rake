namespace :get_fact_quotes_data do
  desc "retreive data from mysql:quotes"
  task retreive_data_quotes: :environment do
    puts "Change 'building_type' to 'Company_name'"
    quote = Quote.select ("created_at, building_type, quote_email, amount_of_elevator_needed")
    puts quote
  end
end