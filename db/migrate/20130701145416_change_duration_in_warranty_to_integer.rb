class ChangeDurationInWarrantyToInteger < ActiveRecord::Migration
  def change
    remove_column :warranties, :duration_in_days
    add_column :warranties, :duration_in_days, :integer
  end
end
