require 'spec_helper'

describe Asset do
  it {should belong_to :asset_type}
  it {should belong_to :form}
  it {should have_many :asset_attributes_groups}
  it {should have_many :assignments}
  it {should have_many(:asset_attributes).through(:asset_attributes_groups)}

  [:asset_id, :serial, :warranty_id, :company_id, :warranty_start, :procurement_date].each do |field|
    it { should validate_presence_of field }
  end
end
