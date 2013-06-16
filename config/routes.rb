Inventory::Application.routes.draw do
  resources :asset_types, only: [:new, :create, :index] do
    resources :assets, only: [:create, :new]
  end

  resources :assets, only: [:index, :show]
end
