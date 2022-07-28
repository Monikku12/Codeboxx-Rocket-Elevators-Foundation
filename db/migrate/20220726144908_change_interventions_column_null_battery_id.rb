class ChangeInterventionsColumnNullBatteryId < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :battery_id, false)
  end
end
