class AddIndexOnAdIdToEmployee < ActiveRecord::Migration
  def change
    add_index :employees, :ad_id
  end
end
