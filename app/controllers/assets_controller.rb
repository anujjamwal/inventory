class AssetsController < ApplicationController
  def new
    @asset_type = AssetType.where(id: params[:asset_type_id]).last
    @form = @asset_type.forms.last
    @asset = @asset_type.assets.new
  end

  def create

  end
end
