require 'spec_helper'

describe Employee do
  context :validations do
    it { should have_many(:asset_assignments) }
  end
end