class Address < ApplicationRecord
    belongs_to :buildings, optional: true
end
