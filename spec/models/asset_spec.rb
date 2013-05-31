require 'spec_helper'

describe Asset do
  it {should belong_to :asset_type}
  it {should validate_presence_of :name}
  it {should validate_presence_of :serial}
  it {should have_many :asset_attributes_groups}
end
