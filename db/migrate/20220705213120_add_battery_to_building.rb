class AddBatteryToBuilding < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :battery, foreign_key: true
  end
end
