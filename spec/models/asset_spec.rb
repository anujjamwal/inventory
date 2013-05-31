require 'spec_helper'

describe Asset do
  it {should belong_to :asset_type}
  it {should belong_to :form_attributes_group}
  it {should validate_presence_of :name}
  it {should validate_presence_of :serial}
end
