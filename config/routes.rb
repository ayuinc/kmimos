ServihogarRails::Application.routes.draw do
	
  resources :provider_attachments, only: [:create, :destroy]

  resources :referrals

  root 'providers#home'

  resources :providers do
    member do
      get 'apply_to_new_version' 
    end
    collection do
      get 'update_state', as: 'update_state'
    end
  end

  resources :bookings
  resources :meetings

  resources :providers_sessions, only: [:new, :create, :destroy]

  match '/salir', 
      to: 'providers_sessions#destroy', as: 'salir', via: :delete

  resources :categories, only: [:show]

  get 'pages/tc' => 'high_voltage/pages#show', id: 'tc'
  
  get 'la' => 'providers#la_home', as: 'la_home'

  get '/ver_ultimos_cuidadores_inscritos' => 'providers#ver_ultimos_cuidadores_inscritos'

end
