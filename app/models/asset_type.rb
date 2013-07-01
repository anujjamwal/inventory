class AssetType < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :forms, foreign_key: :asset_type_id
  has_many :assets
  has_many :models
end
