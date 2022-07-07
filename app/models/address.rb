class Address < ApplicationRecord
    belongs_to :buildings, optional: true
    belongs_to :customer, optional: true
end
