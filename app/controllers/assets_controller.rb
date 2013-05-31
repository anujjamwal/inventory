class AssetsController < ApplicationController
  def new
    @asset = FormAttributesGroup.where(:id => params[:blueprint_id]).last.assets.new 
  end
end
