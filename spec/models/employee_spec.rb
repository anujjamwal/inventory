require 'spec_helper'

describe Employee do
  context :associations do
    it { should have_many(:assignments) }
  end

  context :validations do
    it { should validate_uniqueness_of(:ad_id) }
    it { should validate_presence_of(:ad_id) }
  end
end