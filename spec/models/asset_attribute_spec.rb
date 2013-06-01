require 'spec_helper'

describe AssetAttribute do
  it { should belong_to :asset_attributes_group }
  it { should belong_to :form_attribute }

  it 'should respond to the method by name same as name attr and return value' do
    a = AssetAttribute.new name: 'company_name_for_you', value: 'O M G'
    a.company_name_for_you.should == 'O M G'
  end
end