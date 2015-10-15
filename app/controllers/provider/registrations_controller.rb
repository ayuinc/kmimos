class Provider::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :last_name_1, :last_name_2, :dni, :phone, :description, :email_c, :avatar,
  :price, :areas_externas, :emergencia, :experiencia, :active, :latitude, :longitude, :address,
        :email, :password, :password_confirmation, )
    end
    
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :last_name_1, :last_name_2, :dni, :phone, :description, :email_c, :avatar,
  :price, :areas_externas, :emergencia, :experiencia, :active, :latitude, :longitude, :address,
        :email, :password, :password_confirmation)
    end
    
  end

end