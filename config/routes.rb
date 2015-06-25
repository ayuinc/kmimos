ServihogarRails::Application.routes.draw do
	
  resources :provider_attachments, only: [:create, :destroy]

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
  
end
