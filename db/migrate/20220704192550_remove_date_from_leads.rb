class RemoveDateFromLeads < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :date, :datetime
  end
end
