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
    respond_to do |format|
      format.html
      format.json { render json: asset_type_json }
    end
  end

  private
  def asset_type_params
    params[:asset_type].permit(:name)
  end

  def asset_type_json
    result = []
    @asset_types.each do |type|
      unassigned_count = Asset.unassigned_count(type.id)
      result << {
          unassigned: unassigned_count,
          image: type.image,
          status: unassigned_count > 0 ? t('asset_type.available') : t('asset_type.unavailable')
      }
    end
    result
  end
end
