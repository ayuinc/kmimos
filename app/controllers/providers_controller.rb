class ProvidersController < ApplicationController
  include Mobylette::RespondToMobileRequests

  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  before_action :set_country, only: [:index,:home]

  #Static pages cached
  caches_page :benefits

  def index
    # Get search form params
    session[:from_date]     = params[:from_date]
    session[:to_date]       = params[:to_date]
    
    session[:q_location]    = Location.find(params[:q][:locations_id_eq]).name rescue nil
    session[:q_location_id] = params[:q][:locations_id_eq] rescue nil
    
    if session[:from_date].to_s.length == 0 || session[:to_date].to_s.length == 0 || session[:q_location] == nil
      redirect_to '/'
    else
      @location = Location.find(params[:q][:locations_id_eq]).name rescue ''
    
      @search = Provider.search(params[:q])

      @state_id = params[:states][:id] rescue nil
      @location_id = params[:locations][:id] rescue nil

      if !@state_id.to_s.empty?
        state = State.find(@state_id)
        @providers = Location.find(@location_id).providers if !@location_id.empty?
        @providers = Provider.where(id: state.locations.map{|location| location.providers.map{|provider| provider.id}}.flatten) if @location_id.empty?
        @providers = @providers.where(active: true) if @providers != nil
      else
        @providers = Provider.where(active: true)
      end
      
      @providers = @providers.where(id: Rate.where("price>0").map{|rate| rate.provider_id}.flatten)
      @providers = @providers.order(:id) rescue []

      #Custom view for mobile
      respond_to do |format|
        format.html   { render 'index' }
        format.mobile { render 'index_mobile', layout: 'mobile' }
      end
    end
  end

  def home
    p current_country
    @benefits = Benefit.all
    @agent = request.env["HTTP_USER_AGENT"]

    @search = Provider.search(params[:q])
    @referral = Referral.new
    p @search
    p current_country
    respond_to do |format|
      format.html   { render 'home', layout: 'home' }
      format.mobile { render 'home_mobile', layout: 'mobile' }
    end
  end

  def la_home
    @countries = Country.all
    render :layout => "inter"
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    @search = Provider.search(params[:q])
    if current_user != nil
      @comment = Comment.new
      @comment.user_id = current_user.id
    end

    if @provider.active
      @provider_attachments = @provider.provider_attachments.all
      respond_to do |format|
        format.html   { render 'show', layout: 'application' }
        format.mobile { render 'show_mobile', layout: 'mobile' }
      end
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end

  def benefits

  end

  # GET /providers/new
  def new
    @provider = Provider.new
    @provider_attachment = @provider.provider_attachments.build

  end

  # GET /providers/1/edit
  def edit
    if current_provider != nil
      @provider_attachment = @provider.provider_attachments.build
      @new_provider_attachment = @provider.provider_attachments.new
      @provider_attachments = @provider.provider_attachments.all
  
      @provider = Provider.find(params[:id])
      # @provider.pictures.build
    else
      redirect_to '/providers/sign_in'
    end
  end


  def create
    @provider = Provider.new(all_provider_params)
    @provider.active = false
    @provider.category_id = Category.find_by_name("Hotel").id

    if @provider.save
      session[:provider_id] = @provider.id
      unless params[:provider_attachments].nil?
        params[:provider_attachments]['photo'].each do |a|
           @provider_attachment = @provider.provider_attachments.create!(:photo => a, :provider_id => @provider.id)
        end
      end
      flash.now[:success] = "Hola #{@provider.name}, bienvenido a Kmimos."
      redirect_to root_path
    else
     # fail
     render "new"
     #redirect_to new_provider_path
    end
  end

  def update
    @provider = Provider.find(params[:id])

    if @provider.update_attributes(all_provider_params)
      redirect_to root_path
    else
      format.html { render action: 'edit' }
    end
  end

  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url }
      format.json { head :no_content }
    end
  end

  def update_state
    state = State.find(params[:country_id])
    @locations = state.locations rescue nil
    render partial: 'locations'
  end

  private

  def set_country
    @country = current_country
    redirect_to :action => :la_home if @country == nil
  end

  def set_provider
    @provider = Provider.find(params[:id])
  end

  private

  def all_provider_params
    params.require(:provider).permit!
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def provider_params
    params.require(:provider).permit(:tipo_propiedad, :areas_externas, :emergencia, :experiencia,
    :name, :last_name_1, :last_name_2, :dni, :avatar, :avatar_cache, :description,
    :email, :email_c, :phone, :price, :avg_rating, :property_id, :category_id, :latitude, :longitude,
    :address, :password, :password_confirmation,:q, locations_attributes: [:id],
    location_ids: [], provider_attachments_attributes: [:id, :provider_id, :photo],
    age_ids: [], size_ids: [])
  end




end
