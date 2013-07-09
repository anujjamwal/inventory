require 'spec_helper'

describe Assignment do
  context :associations do
    it { should belong_to(:asset) }
  end

  context :no_update do
    it 'should throw readonly exception when update the model is called' do
      assignment = Assignment.create!
      assignment.comment = 'Hello comment'
      expect {assignment.save}.to raise_error(ActiveRecord::ReadOnlyRecord)
    end

    it 'should throw readonly exception when destroy the model is called' do
      assignment = Assignment.create!

      expect {assignment.destroy}.to raise_error(ActiveRecord::ReadOnlyRecord)
    end
  end
end