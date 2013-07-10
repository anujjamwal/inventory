class AssetType < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :forms, foreign_key: :asset_type_id
  has_many :assets
  has_many :models

  def unassigned_count
    Asset.unassigned_count self.id
  end

  def total_asset_count
    Asset.where(asset_type_id: self.id).count(:id)
  end
end
