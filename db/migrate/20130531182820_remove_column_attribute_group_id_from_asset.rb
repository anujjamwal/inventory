class RemoveColumnAttributeGroupIdFromAsset < ActiveRecord::Migration
  def change
    remove_column :assets, :attribute_group_id
  end
end
