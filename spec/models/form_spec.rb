require 'spec_helper'

describe Form do
  it { should belong_to :asset_type }
  it { should have_many(:form_attributes_groups) }
end