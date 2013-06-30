class AddColumnFormIdToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :form_id, :integer
  end
end
