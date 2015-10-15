ServihogarRails::Application.routes.draw do
	
  devise_for :users
  devise_for :providers, :controllers => {:registrations => "provider/registrations"}
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :provider_attachments, only: [:create, :destroy]
  
  ActiveAdmin.routes(self)

  resources :referrals

  root 'providers#home'

  resources :providers

  resources :bookings
  resources :meetings

  resources :providers_sessions, only: [:new, :create, :destroy]

  match '/salir', 
      to: 'providers_sessions#destroy', as: 'salir', via: :delete

  resources :categories, only: [:show]

  get 'pages/tc' => 'high_voltage/pages#show', id: 'tc'
  
  get 'la' => 'providers#la_home', as: 'la_home'

end
