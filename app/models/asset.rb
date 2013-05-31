class Asset < ActiveRecord::Base
  serialize :data
  
  attr_accessible :name, :serial, :procurement_date
  
  belongs_to :asset_type
  belongs_to :form_attributes_group, foreign_key: :attribute_group_id
  
  validates_presence_of :name
  validates_presence_of :serial
end
