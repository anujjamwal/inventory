class AssetTypesController < ApplicationController
  def new
    @asset_type = AssetType.new
  end
  
  def create 
    @asset_type = AssetType.new asset_type_params
    if @asset_type.save
      redirect_to asset_types_path
    else
      render :new
    end
  end

  def index
    @asset_types = AssetType.all
  end

  private
  def asset_type_params
    params[:asset_type].permit(:name)
  end
end
