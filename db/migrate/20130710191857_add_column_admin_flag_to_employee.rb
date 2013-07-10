class AddColumnAdminFlagToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :admin_flag, :boolean
  end
end
