ServihogarRails::Application.routes.draw do
	
  resources :provider_attachments

  resources :referrals

  root 'providers#home'

  resources :providers

  resources :bookings

  resources :providers_sessions, only: [:new, :create, :destroy]

  match '/salir', 
      to: 'providers_sessions#destroy', as: 'salir', via: :delete

  resources :categories, only: [:show]

  get 'pages/thank_you' => 'high_voltage/pages#show', id: 'thank_you'
  
end
