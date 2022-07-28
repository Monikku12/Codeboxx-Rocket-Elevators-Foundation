class ChangeInterventionsColumnNullCustomerId < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :customer_id, false)
  end
end
