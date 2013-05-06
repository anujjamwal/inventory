class AttributeGroup < ActiveRecord::Base
  attr_accessible :name
  
  validates_presence_of :name
  
  has_many :asset_attributes
  has_many :attribute_groups
  has_many :assets
  belongs_to :parent, class_name: AttributeGroup, foreign_key: :attribute_group_id
  belongs_to :asset_type
end
