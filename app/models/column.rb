class Column < ApplicationRecord
    belongs_to :batteries, optional: true
end
