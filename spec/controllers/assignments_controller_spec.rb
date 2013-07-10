require 'spec_helper'

describe AssignmentsController do
  let(:asset) {FactoryGirl.create(:asset)}
  before do
    RubyCAS::Filter.fake('homer')
    controller.stub 'authorize!' => true
  end

  context 'create' do
    it 'should create a new assignment for an asset' do
      post :create, asset_id: asset.id,  assignment: { assignee_id: '10232', assignment_date: Time.now, type: 'EmployeeAssignment' }

      response.should be_ok
      json_response = JSON.parse( response.body)
      json_response["id"].should == EmployeeAssignment.first.id
      json_response["assignee_id"].should == EmployeeAssignment.first.assignee_id
    end

    it 'should unassign an asset from an employee' do
      post :create, asset_id: asset.id, assignment: { assignment_date: Time.now, type: 'Unassigned' }

      response.should be_ok
      json_response = JSON.parse( response.body)
      json_response["id"].should == Unassigned.last.id
    end
  end
end