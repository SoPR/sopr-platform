SoprPlatform::Application.routes.draw do
  use_doorkeeper
  get 'events', to: 'events#index'

  get 'about', to: 'about#index'
  resources :startups
  resources :resources
  resources :groups
  resources :activities
  get 'status', to: 'status#index'

  # You can have the root of your site routed with "root"
  root 'home#index'

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_scope :users do
    get 'users/edit', :to => 'devise/registrations#edit', :as => :user_root # Rails 3
  end
  resources :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  # Public API namespace
  namespace :api do
    namespace :v1 do
      get '/me' => "users#profile"
    end
  end

end
