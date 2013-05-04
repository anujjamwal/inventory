require 'spec_helper'

describe AssetAttribute do
  it {should validate_presence_of :name}
  it {should validate_presence_of :input_element_type}

  it "should execute the erb code in value_fill_expression to get value_fill" do
    attribute =  AssetAttribute.new :value_fill_expression => "<%= 10+10 %>"
    attribute.value_fill.should == "20"
  end
  
  it "should not fail if value_fill_expression is not present" do
    attribute =  AssetAttribute.new
    attribute.value_fill.should == nil
  end
end
