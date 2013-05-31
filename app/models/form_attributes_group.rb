class FormAttributesGroup < ActiveRecord::Base
  attr_accessible :name
  
  validates_presence_of :name
  
  has_many :form_attributes, foreign_key: :attribute_group_id
  has_many :form_attributes_groups, foreign_key: :attribute_group_id
  has_many :assets, foreign_key: :attribute_group_id
  belongs_to :parent, class_name: FormAttributesGroup, foreign_key: :attribute_group_id
  belongs_to :asset_type
end
