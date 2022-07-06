json.extract! dim_customer, :id, :creation_date, :company_name, :full_name, :company_contact_email, :Nb_Elevator, :customer_city, :created_at, :updated_at
json.url dim_customer_url(dim_customer, format: :json)
