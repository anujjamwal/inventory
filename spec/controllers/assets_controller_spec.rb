require 'spec_helper'

describe AssetsController do
  it 'should present the user with new asset form' do
    asset_type = FactoryGirl.create :asset_type
    asset_type.forms.create! :name => "Blueprint"
    
    get :new, :asset_type_id => asset_type.id
    
    response.should be_success
  end

  context :create do
    it 'should create a new asset' do

    end
  end
end
