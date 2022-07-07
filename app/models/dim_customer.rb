class DimCustomer < ApplicationRecord
    establish_connection :myapp_development
    self.dim_customers = "customers"
end
