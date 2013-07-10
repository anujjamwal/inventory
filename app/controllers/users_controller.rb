class UsersController < ApplicationController
  skip_before_filter :authorize!, only: [:employee_dashboard, :toggle_admin]
  def dashboard
  end

  def employee_dashboard
    @assets = current_user.current_assigned_assets
  end

  def toggle_admin
    @user = Employee.find_by id: params[:id]
    @user.admin_flag ^= true
    @user.save!
    redirect_to root_path
  end
end