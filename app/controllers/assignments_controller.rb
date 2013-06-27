class AssignmentsController < ApplicationController
  before_filter :ensure_employee, only: :create

  def create
    asset = Asset.find_by id: params[:asset_id]
    assignment = asset.assignments.new type: params[:assignment][:type], employee_id: @employee.id, assignment_date: params[:assignment][:assignment_date]
    assignment.save!
    render json: assignment
  end

  private
  def ensure_employee
    @employee = Employee.where(emp_id: params[:assignment][:employee_id]).first_or_create
  end
end