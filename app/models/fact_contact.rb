class FactContact < ApplicationRecord
    establish_connection :myapp_development
    self.fact_contacts = "leads"
end
