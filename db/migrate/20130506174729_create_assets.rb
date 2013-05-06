class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.string :serial
      t.text :data
      t.references :asset_type
      t.references :attribute_group 
      t.datetime :procurement_date

      t.timestamps
    end
  end
end
