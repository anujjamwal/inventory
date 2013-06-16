class FormAttributesGroup < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :form_attributes, foreign_key: :attribute_group_id
  belongs_to :form, foreign_key: :attribute_group_id

  default_scope :include => :form_attributes
end
