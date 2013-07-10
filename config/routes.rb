Inventory::Application.routes.draw do
  resources :asset_types, only: [:new, :create, :index] do
    resources :assets, only: [:create, :new]
  end

  resources :assets, only: [:index, :show] do
    member do
      get :clone, as: :clone_asset
    end
    resources :assignments, only: [:create]
  end

  get 'dashboard' => 'users#dashboard'
  get 'logout' => 'application#logout'

  resources :warranties, only: [:create, :index]
  resources :offices, only: [:create, :index]
  resources :countries, only: [:create, :index]
  resources :models, only: [:create, :index]
  resources :companies, only: [:create, :index]

  root to: 'application#root'
end
