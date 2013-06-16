class AssetsController < ApplicationController
  before_filter :load_asset_type

  def new
    @form = @asset_type.forms.last
    @asset = @asset_type.assets.build_from_form @form
  end

  def create
    @asset = @asset_type.assets.new asset_params
    if @asset.save
      redirect_to asset_type_assets_path(asset_type_id: @asset_type.id)
    else
      render :new
    end
  end

  def index
    @assets = @asset_type.assets.reverse_order
  end

  private
  def asset_params
    params[:asset].permit(asset_attributes_groups_attributes: [:name, :serial, :procurement_date, :form_attributes_group_id, :name, asset_attributes_attributes: [:name, :value, :form_attribute_id]])
  end

  def load_asset_type
    @asset_type = AssetType.where(id: params[:asset_type_id]).last
  end
end
