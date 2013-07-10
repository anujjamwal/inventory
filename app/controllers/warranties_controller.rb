class WarrantiesController < ApplicationController
  def create
    @warranty = Warranty.create warranty_params
    render json: @warranty
  end

  def index
    @offices = params[:company] ? Warranty.where(company_id: params[:company]) : Warranty.all
    render json: @offices
  end

  private
  def warranty_params
    params.require(:warranty).permit(:name, :description, :company_id, :duration_in_days)
  end
end