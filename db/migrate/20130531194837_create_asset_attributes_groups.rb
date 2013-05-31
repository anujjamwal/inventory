class CreateAssetAttributesGroups < ActiveRecord::Migration
  def change
    create_table :asset_attributes_groups do |t|
      t.string :name
      t.integer :asset_id
      t.integer :form_attributes_group_id

      t.timestamps
    end
  end
end
