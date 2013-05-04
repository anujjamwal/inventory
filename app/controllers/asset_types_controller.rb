class AssetTypesController < ApplicationController
  def new
    @asset_type = AssetType.new
  end
  
  def create 
    @asset_type = AssetType.new params[:asset_type]
    if @asset_type.save
      redirect_to new_asset_type_path
    else
      render :new
    end
  end
end
