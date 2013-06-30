require 'spec_helper'

describe AssetsController do
  let(:asset_type) {FactoryGirl.create :asset_type}

  it 'should present the user with new asset form' do
    asset_type.forms.create! :name => "Blueprint"

    get :new, :asset_type_id => asset_type.id

    response.should be_success
  end

  context :create do
    it 'should create a new asset' do
      Asset.any_instance.should_receive(:save).and_return(true)
      asset_params = {"asset_id" => "sss", "serial" => "nbuibcibviberu", "procurement_date" => "2013-06-11", warranty_id: 1, company_id: 2, office_id: 3,
                      "asset_attributes_groups_attributes" => [{"form_attributes_group_id" => "2", "name" => "General",
                                                     "asset_attributes_attributes" => [{"name" => "Company", "form_attribute_id" => "1", "value" => "company"},
                                                                            {"name" => "Model", "form_attribute_id" => "2", "value" => "aaaaa"},
                                                                            {"name" => "Warranty", "form_attribute_id" => "3", "value" => "sdasdasdasd"},
                                                                            {"name" => "Warranty Start", "form_attribute_id" => "4", "value" => "2013-06-19"},
                                                                            {"name" => "Warranty End", "form_attribute_id" => "5", "value" => "2013-06-13"}]},
                                                    {"form_attributes_group_id" => "3", "name" => "Second",
                                                     "asset_attributes_attributes" => [{"name" => "Model", "form_attribute_id" => "6", "value" => "asdadasd"},
                                                                            {"name" => "Warranty", "form_attribute_id" => "7", "value" => "asdasdasdas"}]}]}

      post :create, asset: asset_params, asset_type_id: asset_type.id

      response.should redirect_to(assets_path)
    end

    it 'should not redirect if create a new asset fails' do
      Asset.any_instance.should_receive(:save).and_return(false)
      asset_params = {"name" => "", "serial" => "nbuibcibviberu", "procurement_date" => "2013-06-11",
                      "asset_attributes_groups_attributes" => [{"form_attributes_group_id" => "2", "name" => "General",
                                                                "asset_attributes_attributes" => [{"name" => "Company", "form_attribute_id" => "1", "value" => "company"},
                                                                                                  {"name" => "Model", "form_attribute_id" => "2", "value" => "aaaaa"},
                                                                                                  {"name" => "Warranty", "form_attribute_id" => "3", "value" => "sdasdasdasd"},
                                                                                                  {"name" => "Warranty Start", "form_attribute_id" => "4", "value" => "2013-06-19"},
                                                                                                  {"name" => "Warranty End", "form_attribute_id" => "5", "value" => "2013-06-13"}]},
                                                               {"form_attributes_group_id" => "3", "name" => "Second",
                                                                "asset_attributes_attributes" => [{"name" => "Model", "form_attribute_id" => "6", "value" => "asdadasd"},
                                                                                                  {"name" => "Warranty", "form_attribute_id" => "7", "value" => "asdasdasdas"}]}]}

      post :create, asset: asset_params, asset_type_id: asset_type.id

      response.should be_ok
    end
  end

  context :index do
    it 'should show all assets for the given asset type' do
      Asset.should_receive(:all).and_call_original

      get :index

      response.should be_success
    end
  end

  context :show do
    it 'should show the asset' do
      asset = FactoryGirl.create( :asset, asset_type: asset_type)

      get :show, id: asset.id

      response.should be_success
    end
  end

  context :clone do
    it 'should show the clone asset page' do
      form = Form.create! name: :name
      asset = FactoryGirl.create( :asset, asset_type: asset_type, form: form)
      Asset.count.should == 1

      get :clone, id: asset.id

      response.should be_success
      Asset.count.should == 1
    end
  end
end
