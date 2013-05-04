class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :asset_type_attributes do |t|
      t.string :name
      t.string :input_element_type
      t.boolean :required
      t.string :value_fill_expression
      t.string :default_value
      t.references :asset_type

      t.timestamps
    end
  end
end
