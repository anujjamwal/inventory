class AssetType < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name

  has_many :asset_type_attributes
end
