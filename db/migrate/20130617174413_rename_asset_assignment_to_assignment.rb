class RenameAssetAssignmentToAssignment < ActiveRecord::Migration
  def change
    rename_table :asset_assignments, :assignments
  end
end
