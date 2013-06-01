class AssetAttribute < ActiveRecord::Base
  belongs_to :form_attribute
  belongs_to :asset_attributes_group

  def method_missing method_name, *args
    return self[:value] if method_name.to_s == self[:name].try(:snake_case)
    super
  end
end
