class CountriesController < ApplicationController
  def create
    @country = Country.create country_params
    render json: @country
  end

  def index
    @countries = Country.all
    render json: @countries
  end

  private
  def country_params
    params.require(:country).permit(:name)
  end
end