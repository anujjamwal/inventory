require 'spec_helper'

describe AssetType do
  it {should validate_presence_of :name}
  it {should have_many :forms}
  it {should have_many :assets}
end
