class RemoveNameSerialProcurementDateFromAsset < ActiveRecord::Migration
  def change
    remove_column :assets, :name
    remove_column :assets, :serial
    remove_column :assets, :procurement_date
  end
end
