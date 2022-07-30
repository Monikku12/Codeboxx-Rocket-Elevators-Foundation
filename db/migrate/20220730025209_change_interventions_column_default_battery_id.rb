class ChangeInterventionsColumnDefaultBatteryId < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:interventions, :battery_id, 1)
  end
end