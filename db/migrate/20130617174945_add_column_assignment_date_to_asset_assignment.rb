class AddColumnAssignmentDateToAssetAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :assignment_date, :timestamp
  end
end
