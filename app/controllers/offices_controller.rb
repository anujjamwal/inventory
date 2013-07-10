class OfficesController < ApplicationController
  def create
    @office = Office.create office_params
    render json: @office
  end

  def index
    @offices = params[:country] ? Office.where(country_id: params[:country]) : Office.all
    render json: @offices
  end

  private
  def office_params
    params.require(:office).permit(:name, :country_id)
  end
end