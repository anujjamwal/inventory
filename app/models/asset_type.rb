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

  def statistics
    result = {}
    ActiveRecord::Base.connection.execute( <<-SQL
      Select a.name, b.count
      From companies a, (
        Select company_id, count(id) count
        From assets
        Where asset_type_id = #{self.id}
        group by company_id
      ) b
      where a.id = b.company_id
    SQL
    ).each{|e|result[e[0]] = e[1]}
    result
  end
end
