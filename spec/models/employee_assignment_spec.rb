require 'spec_helper'

describe EmployeeAssignment do
  context :associations do
    it { should belong_to(:employee) }
  end
end