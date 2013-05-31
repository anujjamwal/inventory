require 'spec_helper'

describe FormAttribute do
  it {should validate_presence_of :name}
  it {should validate_presence_of :input_element_type}

  it "should execute the erb code in value_fill_expression to get value_fill" do
    attribute =  FormAttribute.new :value_fill_expression => "<%= 10+10 %>"
    attribute.value_fill.should == "20"
  end
  
  it "should not fail if value_fill_expression is not present" do
    attribute =  FormAttribute.new
    attribute.value_fill.should == nil
  end
end
