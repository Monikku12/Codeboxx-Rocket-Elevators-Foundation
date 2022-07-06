class Customer < ApplicationRecord
    belongs_to :users, optional: true
end
