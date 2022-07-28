class ChangeInterventionsColumnNullAuthor < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :author, false)
  end
end
