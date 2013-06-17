class CreateAssetAssignments < ActiveRecord::Migration
  def change
    create_table :asset_assignments do |t|
      t.references :asset
      t.references :employee
      t.string :type
      t.string :comment

      t.timestamps
      t.index :type
    end
  end
end
