class AddIndexOnAssetIdToAssets < ActiveRecord::Migration
  def change
    add_index :assets, :asset_id
  end
end
