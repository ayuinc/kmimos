ServihogarRails::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users, :controllers => {:registrations => "user/registrations", sessions: "user/sessions"}
  devise_for :providers, :controllers => {:registrations => "provider/registrations", sessions: "provider/sessions"}

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :provider_attachments, only: [:create, :destroy]

  resources :referrals

  root 'providers#home'
  get 'bookings/booking_resume/:booking_id' => 'bookings#booking_resume', as: 'booking_resume'
  get 'bookings/send_mail/:provider_id/:booking_id' => 'bookings#send_mail'
  get 'meetings/send_mail/:provider_id/:meeting_id' => 'meetings#send_mail'
  get 'providers/update_state' => 'providers#update_state'
  

  resources :providers do
    collection do      
       get 'create_info' 
    end  
  end    

  resources :users

  resources :pets
  resources :bookings

  post 'bookings/new' => 'bookings#new'

  resources :meetings

  resources :comments

  resources :favorites

  get 'beneficios' => 'providers#benefits'
  get 'promo' => 'providers#promo'

  namespace :api, defaults: { format: 'json' } do
    get 'providers/get_providers' => 'providers#get_providers', as: 'api_get_providers'
    get 'providers/get_session_params' => 'providers#get_session_params', as: 'api_get_session_params'
    get 'bookings/get_new_booking' => 'providers#get_new_booking', as: 'api_get_new_booking'

    post 'bookings/get_rate' => 'bookings#get_rate'
    get 'bookings/get_rate' => 'bookings#get_rate'

    post 'bookings/get_pet_rate' => 'bookings#get_pet_rate', as: 'get_pet_rate'
    

    get 'services/get_services' => 'services#get_services', as: 'api_get_services'
    get 'general/get_sizes' => 'general#get_sizes', as: 'api_get_sizes'
  end

  resources :categories, only: [:show]

  get 'pages/tc' => 'high_voltage/pages#show', id: 'tc'

  get 'la' => 'providers#la_home', as: 'la_home'

end
