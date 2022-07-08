namespace :dwh do
  require "json"

  task fake: :environment do
    puts "-----------------------"
    file = File.read(File.join(Rails.root, 'lib', 'addresses.json'))
    data = JSON.parse(file)
    addresses = data["addresses"]

    addresses.each do |address|
      #pp "Address is : #{address["address1"]}"

      user = User.create!(
        email: Faker::Internet.email, 
        password: 'password123', 
      )

      _address = Address.create!(
        type_of_address: ['Business', 'Billing', 'Shipping', 'Home'].sample,
        status: ['Active', 'Inactive'].sample,
        entity: ['Customer', 'Building'].sample,
        number_and_street: address["address1"],
        suite_or_apartment: Faker::Address.secondary_address,
        city: address["city"],
        postal_code: address["postalCode"],
        country: address["state"],
        notes: Faker::Lorem.paragraph(sentence_count: 2),
      )

      customer = Customer.create!(
        company_name: Faker::Company.name,
        address: _address,
        company_contact_full_name: Faker::Name.name,
        company_contact_phone: Faker::PhoneNumber.phone_number,
        company_contact_email: Faker::Internet.email,
        company_description: Faker::Company.industry,
        service_technical_authority_full_name: Faker::Name.name,
        service_technical_authority_phone: Faker::PhoneNumber.phone_number,
        service_technical_manager_email: Faker::Internet.email,
        user: user,
      )

      building = Building.create!(  
        number_and_street: ['AAA'].sample, 
        building_administrator_full_name: Faker::Name.name,
        building_administrator_email: Faker::Internet.email,
        building_administrator_phone: Faker::PhoneNumber.phone_number,
        building_technical_contact_full_name: Faker::Name.name,
        building_technical_contact_email: Faker::Internet.email,
        building_technical_contact_phone: Faker::PhoneNumber.phone_number,
        customer: customer,
        #building_detail: building_detail,
        #battery: batterytest.id,
        address: _address,
      )

      building_detail = BuildingDetail.create!(
        key: Faker::Lorem.sentence,
        value: Faker::Lorem.sentence(word_count: 2),
        building: building,
      )

      5.times do  
        battery = Battery.create(
          batterie_type: ["Residential", "Corportate", "Commercial", "Hybrid"].sample,
          status: ["Active", "Inactive", "Intervention"].sample,
          employeeId: employeeIdtest.id,
          commissioning_date: Faker::Date.between(from: '2019-07-06', to: '2020-07-06'),
          last_inspection_date: Faker::Date.between(from: '2019-07-06', to: '2020-07-06'),
          certificate_of_operation: Faker::Lorem.paragraphs,
          informations: Faker::Lorem.paragraphs,
          notes: Faker::Lorem.paragraph(sentence_count: 2),
          column_id: columntest.id,
        )
      end
    data = JSON.load file
    pp hash["addresses"]
    end
  puts "-----------------------"
  end

    

end