class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter RubyCAS::Filter
  append_before_filter :authenticate
  append_before_filter :authorize!

  def root
    redirect_to dashboard_path
  end

  def logout
    RubyCAS::Filter.logout self
  end

  private
  def authenticate
    @current_user = Employee.find_by_ad_id( session[:cas_user])
  end

  def authorize!
    redirect_to employee_dashboard_path and return false unless @current_user.admin?
  end

  def current_user
    @current_user
  end
end
