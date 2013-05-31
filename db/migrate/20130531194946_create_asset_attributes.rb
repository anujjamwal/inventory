class CreateAssetAttributes < ActiveRecord::Migration
  def change
    create_table :asset_attributes do |t|
      t.string :name
      t.integer :asset_attributes_group_id
      t.integer :form_attribute_id
      t.string :value

      t.timestamps
    end
  end
end
