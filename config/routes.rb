Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, only: [ :index, :show, :update, :create, :delete ]
      resources :categories, only: [ :index, :show, :update, :create, :delete ]
      resources :branches, only: [ :index, :show, :update, :create, :delete ]
      resources :orders, only: [ :index, :show, :update, :create, :delete ]
      resources :billing_infos, only: [ :index, :show, :update, :create, :delete ]
      get '/search' => 'items#search'
      devise_scope :user do
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
        post 'registrations' => 'registrations#create', :as => 'register'

      end
    end
  end
end

