require 'spec_helper'

describe AssetTypesController do
  it "should serve the new asset type page" do
    get :new
    
    response.should be_success
  end
end