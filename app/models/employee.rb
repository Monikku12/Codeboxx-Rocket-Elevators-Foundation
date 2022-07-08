class Employee < ApplicationRecord
    belongs_to :user
    belongs_to :battery
end
