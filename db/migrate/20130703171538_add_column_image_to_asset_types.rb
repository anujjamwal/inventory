class AddColumnImageToAssetTypes < ActiveRecord::Migration
  def change
    add_column :asset_types, :image, :string
  end
end
