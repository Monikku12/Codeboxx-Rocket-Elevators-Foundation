class Battery < ApplicationRecord
    belongs_to :buildings, optional: true
end
