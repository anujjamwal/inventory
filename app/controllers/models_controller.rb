class ModelsController < ApplicationController
  def create
    @model = Model.create model_params
    render json: @model
  end

  def index
    @models = params[:company] ? Model.where(company_id: params[:company]) : Model.all
    render json: @models
  end

  private
  def model_params
    params.require(:model).permit(:name, :company_id, :asset_type_id)
  end
end