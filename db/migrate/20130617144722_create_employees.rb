class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :emp_id

      t.timestamps
    end
  end
end
