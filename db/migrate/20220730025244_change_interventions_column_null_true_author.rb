class ChangeInterventionsColumnNullTrueAuthor < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :author, true)
  end
end
