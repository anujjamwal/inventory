class AddAttributeGroupReferenceToAssetAttribute < ActiveRecord::Migration
  def change
    add_column :asset_attributes, :attribute_group_id, :integer
  end
end
