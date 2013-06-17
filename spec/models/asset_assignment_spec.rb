require 'spec_helper'

describe AssetAssignment do
  context :validations do
    it { should belong_to(:asset) }
    it { should belong_to(:employee) }
  end
end