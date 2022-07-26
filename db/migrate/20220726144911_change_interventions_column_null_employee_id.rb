class ChangeInterventionsColumnNullEmployeeId < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :employee_id, true)
  end
end
