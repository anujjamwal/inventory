require 'spec_helper'

describe AssetTypesController do
  it "should serve the new asset type page" do
    get :new
    
    response.should be_success
  end
  
  it "should create a new asset tyep" do
    post :create, :asset_type => {:name => "Keyboard"}
    
    response.should redirect_to(new_asset_type_path)
    AssetType.where(:name => "Keyboard").size.should == 1
  end
  
  it "should render the new template if save call fails" do
    at = asset_type
    AssetType.stub :new => at
    at.should_receive(:save).and_return(false)
    
    post :create, :asset_type => {}
    
    response.should be_success
    AssetType.count.should == 0
    
    AssetType.unstub :new
  end
end