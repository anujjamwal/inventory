class AddStaticColumnsToAsset < ActiveRecord::Migration
  def change
    change_table :assets do |t|
      t.remove :data
      t.string :asset_id
      t.string :serial
      t.timestamp :procurement_date
      t.references :company
      t.references :warranty
      t.references :office
      t.timestamp :warranty_start
    end
  end
end
