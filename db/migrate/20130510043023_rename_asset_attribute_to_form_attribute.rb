class RenameAssetAttributeToFormAttribute < ActiveRecord::Migration
  def change
    rename_table :asset_attributes, :form_attributes
  end
end
