class AssetType < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name
  
  has_many :forms, class_name: FormAttributesGroup
end
