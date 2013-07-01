class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.integer :company_id
      t.integer :asset_type_id
      t.string :name

      t.timestamps
    end
  end
end
