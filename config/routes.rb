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
  get 'dashboards/employee' => 'users#employee_dashboard', as: :employee_dashboard
  get 'logout' => 'application#logout'

  resources :warranties, only: [:create, :index]
  resources :offices, only: [:create, :index]
  resources :countries, only: [:create, :index]
  resources :models, only: [:create, :index]
  resources :companies, only: [:create, :index]

  post 'users/:id/toggle_admin' => 'users#toggle_admin', as: :user_toggle_admin unless Rails.env.production?

  root to: 'application#root'
end
