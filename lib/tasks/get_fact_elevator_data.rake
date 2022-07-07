namespace :get_fact_elevator_data do
  desc "retrieve  data from mysql:elevator"
  task retrieve_data_elevator: :environment do
    puts "Change 'number_and_street' to 'building_city'"
    elevator = Elevator.select ("serial_number, commissioning_date")
    puts elevator
    elevator_building = Building.select ("id, customer_id, number_and_street")
    puts elevator_building
  end
end