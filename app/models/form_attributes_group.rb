class FormAttributesGroup < ActiveRecord::Base
  #attr_accessible :name
  
  validates_presence_of :name
  
  has_many :form_attributes, foreign_key: :attribute_group_id
  belongs_to :form, foreign_key: :attribute_group_id
end
