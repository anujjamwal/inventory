require 'spec_helper'

describe Country do
  it { should have_many :offices }
end