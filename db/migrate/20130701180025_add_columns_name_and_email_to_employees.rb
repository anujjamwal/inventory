class AddColumnsNameAndEmailToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :name, :string
    add_column :employees, :ad_id, :string
    add_column :employees, :email, :string
  end
end
