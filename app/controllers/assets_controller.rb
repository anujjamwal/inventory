class AssetsController < ApplicationController
  def new
    @asset = AttributeGroup.where(:id => params[:blueprint_id]).last.assets.new 
  end
end