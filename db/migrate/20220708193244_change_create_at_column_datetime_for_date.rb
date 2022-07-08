class ChangeCreateAtColumnDatetimeForDate < ActiveRecord::Migration[5.2]
  def change
    change_column :quotes, :quote_created_at, :date
    change_column :leads, :lead_created_at, :date
  end
end
