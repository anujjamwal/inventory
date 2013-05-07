require 'spec_helper'

describe AssetsController do
  it "should present the user with new asset form" do
    asset_type = FactoryGirl.create :asset_type
    asset_type.blueprints.create! :name => "Blueprint"
    
    get :new, :blueprint_id => asset_type.id
    
    response.should be_success
  end
end