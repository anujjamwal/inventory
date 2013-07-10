class CompaniesController < ApplicationController
  def create
    @company = Company.create company_params
    render json: @company
  end

  def index
    @companies = Company.all
    render json: @companies
  end

  private
  def company_params
    params.require(:company).permit(:name)
  end
end