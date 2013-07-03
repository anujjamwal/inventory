class AssetsController < ApplicationController
  before_filter :load_asset_type, only: [:new, :create]
  before_filter :load_asset, only: [:show, :clone]

  def new
    @form = @asset_type.forms.last
    @asset = @asset_type.assets.build_from_form @form
  end

  def clone
    @asset_type = @asset.asset_type
    @form = @asset.form
    @asset = @asset.clone
    render :new
  end

  def create
    @asset = @asset_type.assets.new asset_params
    @form = @asset.form
    if @asset.save
      redirect_to assets_path
    else
      render :new
    end
  end

  def index
    @labels = []
    @labels << (AssetType.find_by(id: params[:type]).name rescue 'Unknown Asset Type') if params[:type]

    if params[:assignment].try(:downcase) == 'unassigned'
      @labels << 'Unassigned'
      @assets = Asset.unassigned(params[:type]||0)
    else
      if params[:type].nil?
        @assets = Asset.all.reverse_order
      else
        @assets = Asset.where(asset_type_id: params[:type]).reverse_order
      end
    end
  end

  def show
    @asset_type = @asset.asset_type

    @labels = [@asset_type.name]
  end

  private
  def asset_params
    params.require(:asset).permit(:serial, :asset_id, :company_id, :warranty_id, :warranty_start, :procurement_date, :form_id, :model_id,
                                  asset_attributes_groups_attributes: [:name, :serial, :procurement_date, :form_attributes_group_id, :name,
                                                                       asset_attributes_attributes: [:name, :value, :form_attribute_id]
                                  ]
    )
  end

  def load_asset_type
    @asset_type = AssetType.where(id: params[:asset_type_id]).last
  end

  def load_asset
    @asset = Asset.find_by id: params[:id]
  end
end
