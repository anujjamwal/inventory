class RenameTableAttributeGroupToFormAttributeGroup < ActiveRecord::Migration
  def change
    rename_table :attribute_groups, :form_attributes_groups
  end
end
