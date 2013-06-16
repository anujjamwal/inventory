require 'spec_helper'

describe Asset do
  it {should belong_to :asset_type}
  it {should have_many :asset_attributes_groups}
end
