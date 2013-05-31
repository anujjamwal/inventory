class Form < FormAttributesGroup
  has_many :form_attributes_groups, foreign_key: :attribute_group_id
  belongs_to :asset_type
end