class AddBuildingDetailToBuilding < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :building_detail, foreign_key: true
  end
end
