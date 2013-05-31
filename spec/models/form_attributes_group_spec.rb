require 'spec_helper'

describe FormAttributesGroup do
  it {should validate_presence_of :name}
  it {should have_many :form_attributes }
  it {should belong_to(:form)}
end
