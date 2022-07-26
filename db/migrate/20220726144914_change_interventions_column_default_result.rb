class ChangeInterventionsColumnDefaultResult < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:interventions, :result, "Incomplete")
  end
end
