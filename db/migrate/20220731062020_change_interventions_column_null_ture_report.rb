class ChangeInterventionsColumnNullTureReport < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:interventions, :report, true)
  end
end
