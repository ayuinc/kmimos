ServihogarRails::Application.routes.draw do
  
  ActiveAdmin.routes(self)
	
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  devise_for :providers, :controllers => {:registrations => "provider/registrations"}
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :provider_attachments, only: [:create, :destroy]
  
  resources :referrals

  root 'providers#home'

  resources :providers
  resources :users

  resources :bookings
  resources :meetings

  resources :providers_sessions, only: [:new, :create, :destroy]
  
  namespace :api, defaults: { format: 'json' } do
    get 'providers/get_providers' => 'providers#get_providers', as: 'api_get_providers'
    get 'services/get_services' => 'services#get_services', as: 'api_get_services'
    get 'general/get_sizes' => 'general#get_sizes', as: 'api_get_sizes'
  end
  
  match '/salir', 
      to: 'providers_sessions#destroy', as: 'salir', via: :delete

  resources :categories, only: [:show]

  get 'pages/tc' => 'high_voltage/pages#show', id: 'tc'
  
  get 'la' => 'providers#la_home', as: 'la_home'

end
