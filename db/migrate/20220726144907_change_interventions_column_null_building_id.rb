class ChangeInterventionsColumnNullBuildingId < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :building_id, false)
  end
end
