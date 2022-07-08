class Quote < ApplicationRecord
    has_one :lead
    belongs_to :customer
end
