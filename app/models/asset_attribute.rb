class AssetAttribute < ActiveRecord::Base
  belongs_to :form_attribute
  belongs_to :asset_attributes_group

end
