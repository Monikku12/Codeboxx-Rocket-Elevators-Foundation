class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author
      t.integer :customerID
      t.integer :buildingID
      t.integer :batteryID
      t.integer :columnID
      t.integer :elevatorID
      t.integer :employeeID
      t.datetime :intervention_started_at
      t.datetime :intervention_ended_at
      t.string :result
      t.text :report
      t.string :status

      t.timestamps
    end
  end
end
