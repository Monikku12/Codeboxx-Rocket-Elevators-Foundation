class FactElevator < ApplicationRecord
    establish_connection :myapp_development
    self.fact_elevators = "elevators"
end
