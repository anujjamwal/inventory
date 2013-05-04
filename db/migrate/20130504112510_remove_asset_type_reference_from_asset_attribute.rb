class RemoveAssetTypeReferenceFromAssetAttribute < ActiveRecord::Migration
  def change
    remove_column :asset_attributes, :asset_type_id
  end
end
