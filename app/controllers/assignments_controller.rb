class AssignmentsController < ApplicationController
  before_filter :ensure_assignee, only: :create

  def create
    asset = Asset.find_by id: params[:asset_id]
    assignment = asset.assignments.new type: params[:assignment][:type], assignee_id: @assignee.id, assignment_date: params[:assignment][:assignment_date]
    assignment.save!
    render json: assignment
  end

  private
  def ensure_assignee
    @assignee = Employee.find_by_employee_id params[:assignment][:assignee_id] if params[:assignment][:type] == EmployeeAssignment.name
    @assignee = Project.find_by_project_code params[:assignment][:assignee_id] if params[:assignment][:type] == ProjectAssignment.name
  end
end