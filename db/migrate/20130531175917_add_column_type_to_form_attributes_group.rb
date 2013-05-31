class AddColumnTypeToFormAttributesGroup < ActiveRecord::Migration
  def change
    add_column :form_attributes_groups, :type, :string
    add_index :form_attributes_groups, :type
  end
end
