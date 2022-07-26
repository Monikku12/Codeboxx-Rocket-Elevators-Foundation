class ChangeInterventionsColumnNullReport < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :report, false)
  end
end
