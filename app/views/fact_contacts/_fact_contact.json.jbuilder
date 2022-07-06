json.extract! fact_contact, :id, :creation_date, :company_name, :email, :project_name, :created_at, :updated_at
json.url fact_contact_url(fact_contact, format: :json)
