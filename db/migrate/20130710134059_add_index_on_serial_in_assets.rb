class AddIndexOnSerialInAssets < ActiveRecord::Migration
  def change
    add_index :assets, :serial
  end
end
