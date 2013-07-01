class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter RubyCAS::Filter

  def root
    redirect_to dashboard_path
  end

  def logout
    RubyCAS::Filter.logout self
  end
end
