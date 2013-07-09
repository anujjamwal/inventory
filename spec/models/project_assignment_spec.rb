require 'spec_helper'

describe ProjectAssignment do
  context :associations do
    it { should belong_to(:project) }
  end
end