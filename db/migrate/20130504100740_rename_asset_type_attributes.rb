class RenameAssetTypeAttributes < ActiveRecord::Migration
  def change
    rename_table :asset_type_attributes, :asset_attributes
  end
end
