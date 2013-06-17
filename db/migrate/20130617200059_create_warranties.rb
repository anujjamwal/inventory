class CreateWarranties < ActiveRecord::Migration
  def change
    create_table :warranties do |t|
      t.string :name
      t.string :duration_in_days
      t.text :description
      t.integer :company_id

      t.timestamps
    end
  end
end
