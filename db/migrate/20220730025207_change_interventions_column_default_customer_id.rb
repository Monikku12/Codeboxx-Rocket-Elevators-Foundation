class ChangeInterventionsColumnDefaultCustomerId < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:interventions, :customer_id, 1)
  end
end