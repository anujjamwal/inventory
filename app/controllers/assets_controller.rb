class AssetsController < ApplicationController
  before_filter :load_asset_type, only: [:new, :create]

  def new
    @form = @asset_type.forms.last
    @asset = @asset_type.assets.build_from_form @form
  end

  def create
    @asset = @asset_type.assets.new asset_params
    if @asset.save
      redirect_to assets_path
    else
      render :new
    end
  end

  def index
    @assets = Asset.all.reverse_order
  end

  def show
    @asset = Asset.find_by id: params[:id]
    @asset_type = @asset.asset_type
  end

  private
  def asset_params
    params.require(:asset).permit(:serial, :asset_id, :company_id, :warranty_id, :warranty_start, :procurement_date,
                          asset_attributes_groups_attributes: [ :name, :serial, :procurement_date, :form_attributes_group_id, :name,
                                                                asset_attributes_attributes: [:name, :value, :form_attribute_id]
                                                              ]
    )
  end

  def load_asset_type
    @asset_type = AssetType.where(id: params[:asset_type_id]).last
  end
end
