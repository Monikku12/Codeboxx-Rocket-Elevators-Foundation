class ChangeInterventionsColumnDefaultBuildingId < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:interventions, :building_id, 1)
  end
end
