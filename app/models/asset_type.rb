class AssetType < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name
  
  has_many :forms, foreign_key: :asset_type_id
  has_many :assets
end
