class ChangeInterventionsColumnNullInterventionEndedAt < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :intervention_ended_at, true)
  end
end
