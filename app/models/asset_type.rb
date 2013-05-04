class AssetType < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name
  
  has_many :blueprints, class_name: AttributeGroup, foreign_key: :asset_type_id
end
