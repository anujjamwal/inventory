class RenameColumnEmployeeIdToAssigneeIdInAssignment < ActiveRecord::Migration
  def change
    rename_column :assignments, :employee_id, :assignee_id
  end
end
