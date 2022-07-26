class ChangeInterventionsColumnNullColumnId < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :column_id, true)
  end
end
