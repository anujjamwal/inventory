class Asset < ActiveRecord::Base
  attr_accessible :name, :serial, :procurement_date, :warranty_start
  
  belongs_to :asset_type
  belongs_to :attribute_group
  
  validates_presence_of :name
  validates_presence_of :serial
end
