class AddElevatorToColumn < ActiveRecord::Migration[5.2]
  def change
    add_reference :columns, :elevator, foreign_key: true
  end
end
