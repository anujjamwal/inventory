class AssetAttributesGroup < ActiveRecord::Base
  has_many :asset_attributes
  belongs_to :asset
  belongs_to :form_attributes_group
end
