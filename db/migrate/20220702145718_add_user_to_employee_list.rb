class AddUserToEmployeeList < ActiveRecord::Migration[5.2]
  def change
    add_reference :employee_lists, :user, foreign_key: true
  end
end
