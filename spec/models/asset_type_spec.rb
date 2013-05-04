require 'spec_helper'

describe AssetType do
  it {should validate_presence_of :name}
  it {should have_many :asset_type_attributes}  
end
