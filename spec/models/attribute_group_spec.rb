require 'spec_helper'

describe AttributeGroup do
  it {should validate_presence_of :name}
  it {should have_many :asset_attributes }
  it {should have_many :attribute_groups }
  it {should belong_to(:parent).class_name(AttributeGroup)}
  it {should belong_to :asset_type}
end