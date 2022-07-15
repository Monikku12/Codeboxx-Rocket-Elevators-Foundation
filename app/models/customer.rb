class Customer < ApplicationRecord
    belongs_to :user
    belongs_to :address
    has_many :buildings
    belongs_to :lead
   
end
