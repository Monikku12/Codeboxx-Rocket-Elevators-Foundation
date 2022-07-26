class ChangeInterventionsColumnNullInterventionStartedAt < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :intervention_started_at, true)
  end
end
