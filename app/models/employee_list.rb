class EmployeeList < ApplicationRecord
    belongs_to :users, optional: true
end
