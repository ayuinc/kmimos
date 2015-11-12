class Provider::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters


  #def create
  #  super
  #  ProviderMailer.welcome_message(@provider).deliver unless @provider.invalid?
  #end
  
  def new
    super
    if params[:provider]
      @provider = params[:provider]
    end
  end


  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit! #(:name, :last_name_1, :last_name_2, :dni, :phone, :description, :email_c, :avatar,
        #:price, :areas_externas, :emergencia, :experiencia, :active, :latitude, :longitude, :address,
        #:email, :password, :password_confirmation, :has_yard, :has_green, :property, :has_other_pets,
        #:provider_attachments_attributes, :location_ids => [] , :age_ids,
        #:size_ids, :own_size_ids, :pet_behavior_id, :pets_allowed,
        #:additional_services_attributes)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit! #(:name, :last_name_1, :last_name_2, :dni, :phone, :description, :email_c, :avatar,
        #:price, :areas_externas, :emergencia, :experiencia, :active, :latitude, :longitude, :address,
        #:email, :password, :password_confirmation, :has_yard, :has_green, :property, :has_other_pets,
        #:provider_attachments_attributes, :location_ids => [] , :age_ids,
        #:size_ids, :own_size_ids, :pet_behavior_id, :pets_allowed,
        #:additional_services_attributes)
    end
  end

end
