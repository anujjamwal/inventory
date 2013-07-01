require 'spec_helper'

describe UsersController do
  before do
    RubyCAS::Filter.fake('homer')
  end

  context :dashboard do
    it 'should show the dashboard' do
      get :dashboard

      response.should be_ok
    end
  end

end