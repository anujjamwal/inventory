require 'spec_helper'

describe UsersController do
  context :dashboard do
    it 'should show the dashboard' do
      get :dashboard

      response.should be_ok
    end
  end

end