class FactQuote < ApplicationRecord
    establish_connection :myapp_development
    self.fact_quotes = "quotes"
end
