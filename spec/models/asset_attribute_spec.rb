require 'spec_helper'

describe AssetAttribute do
  it { should belong_to :asset_attributes_group }
  it { should belong_to :form_attribute }
end