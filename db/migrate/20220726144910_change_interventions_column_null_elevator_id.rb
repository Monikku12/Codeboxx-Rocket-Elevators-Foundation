class ChangeInterventionsColumnNullElevatorId < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :elevator_id, true)
  end
end
