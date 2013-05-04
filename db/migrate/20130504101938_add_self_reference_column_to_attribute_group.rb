class AddSelfReferenceColumnToAttributeGroup < ActiveRecord::Migration
  def change
    add_column :attribute_groups, :attribute_group_id, :integer
  end
end
