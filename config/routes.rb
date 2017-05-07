Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # get 'check/:order_id' => 'pages#check'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, only: [ :index, :show, :update, :create, :delete ]
      resources :categories, only: [ :index, :show, :update, :create, :delete ]
      resources :branches, only: [ :index, :show, :update, :create, :delete ]
      resources :orders, only: [ :index, :show, :update, :create, :delete ]
        post 'remove/:user_id/:item_id', to: 'orders#remove'
        post 'add/:user_id/:item_id/:color/:quantity' => 'orders#add'
        get 'check/:item_id/:order_id' => 'orders#check'
        get 'cart/:user_id/' => 'orders#cart'
      # resource :orders, only: [:show, :index] do
      #   put 'add/:item_id', to: 'orders#add', as: :add_to
      #   put 'remove/:item_id', to: 'orders#remove', as: :remove_from
      # end
      resources :has_items, only: [ :index, :show, :update, :create, :delete ]

      resources :colors, only: [ :index, :show, :update, :create, :delete ]
      resources :users, only: [ :index, :show]
      resources :payments, only: [ :index, :show, :update, :create, :delete ]

      get "billing/:id", to: "users#billing"

      resources :billing_infos, only: [ :index, :show, :update, :create, :delete ]
      get '/search' => 'items#search'
      get '/list' => 'user#list'

      devise_scope :user do
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
        post 'registrations' => 'registrations#create', :as => 'register'

      end
    end
  end
end

