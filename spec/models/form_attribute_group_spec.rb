require 'spec_helper'

describe FormAttributesGroup do
  it {should validate_presence_of :name}
  it {should have_many :form_attributes }
  it {should have_many :form_attributes_groups }
  it {should belong_to(:parent).class_name(FormAttributesGroup)}
  it {should belong_to :asset_type}
end
