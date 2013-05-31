require 'spec_helper'

describe AssetAttributesGroup do
  it { should belong_to :asset }
  it { should have_many :asset_attributes }
  it { should belong_to :form_attributes_group }
end