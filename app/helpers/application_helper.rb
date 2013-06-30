module ApplicationHelper
  def clone_asset_path(params)
    "assets/#{params[:id]}/clone"
  end
end
