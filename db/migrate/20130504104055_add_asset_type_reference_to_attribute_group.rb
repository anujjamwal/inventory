class AddAssetTypeReferenceToAttributeGroup < ActiveRecord::Migration
  def change
    add_column :attribute_groups, :asset_type_id, :integer
  end
end
