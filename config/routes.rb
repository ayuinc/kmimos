ServihogarRails::Application.routes.draw do
  
  ActiveAdmin.routes(self)
	
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  devise_for :providers, :controllers => {:registrations => "provider/registrations"}
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :provider_attachments, only: [:create, :destroy]
  
  resources :referrals

  root 'providers#home'

  resources :bookings

  resources :providers
  resources :users

  resources :pets 
  
  post 'bookings/new' => 'bookings#new'
  
  resources :meetings
 
  resources :comments
  
  resources :favorites
  
  get 'beneficios' => 'providers#benefits'
  
  namespace :api, defaults: { format: 'json' } do
    get 'providers/get_providers' => 'providers#get_providers', as: 'api_get_providers'
    get 'bookings/get_new_booking' => 'providers#get_new_booking', as: 'api_get_new_booking'
    post 'bookings/get_rate' => 'bookings#get_rate', as: 'api_get_rate'
    post 'bookings/get_pet_rate' => 'bookings#get_pet_rate', as: 'get_pet_rate'
    
    
    get 'services/get_services' => 'services#get_services', as: 'api_get_services'
    get 'general/get_sizes' => 'general#get_sizes', as: 'api_get_sizes'
  end

  resources :categories, only: [:show]

  get 'pages/tc' => 'high_voltage/pages#show', id: 'tc'
  
  get 'la' => 'providers#la_home', as: 'la_home'

end
