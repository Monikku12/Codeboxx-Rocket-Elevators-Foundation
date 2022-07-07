class RemoveBuildingdetailIdFromBuilding < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :buildingdetail_id, :string
  end
end
