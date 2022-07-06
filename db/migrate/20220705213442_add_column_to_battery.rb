class AddColumnToBattery < ActiveRecord::Migration[5.2]
  def change
    add_reference :batteries, :column, foreign_key: true
  end
end
