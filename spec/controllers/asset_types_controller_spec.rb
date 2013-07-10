require 'spec_helper'

describe AssetTypesController do
  before do
    RubyCAS::Filter.fake('homer')
    controller.stub 'authorize!' => true
  end

  it 'should serve the new asset type page' do
    get :new
    
    response.should be_success
  end
  
  it 'should create a new asset tyep' do
    post :create, :asset_type => {:name => 'Keyboard'}
    
    response.should redirect_to(asset_types_path)
    AssetType.where(:name => "Keyboard").size.should == 1
  end
  
  it 'should render the new template if save call fails' do
    asset_type = FactoryGirl.build(:asset_type)
    AssetType.stub :new => asset_type
    asset_type.should_receive(:save).and_return(false)
    
    post :create, :asset_type => {}
    
    response.should be_success
    AssetType.count.should == 0
    
    AssetType.unstub :new
  end
  
  it 'should list the asset types' do
    AssetType.should_receive(:all).and_call_original
    
    get :index
    
    response.should be_success
  end
end