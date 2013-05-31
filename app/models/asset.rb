class Asset < ActiveRecord::Base
  serialize :data
  
  attr_accessible :name, :serial, :procurement_date
  
  belongs_to :asset_type
  has_many :asset_attributes_groups

  validates_presence_of :name
  validates_presence_of :serial
end
