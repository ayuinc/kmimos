class ProvidersController < ApplicationController
  include Mobylette::RespondToMobileRequests

  before_action :set_provider, only: [:show, :edit, :update, :destroy] 
  before_action :set_country, only: [:index,:home]
  
  #Static pages cached
  caches_page :benefits

  def index 
    # Get search form params
    session[:from_date]     ||= params[:from_date] 
    session[:to_date]       ||= params[:to_date]  
    session[:q_location]    ||= params[:q][:locations_id_eq]
    
    @search = Provider.search(params[:q])
    
    #Custom view for mobile
    respond_to do |format|
      format.html   { render 'index' }
      format.mobile { render 'index_mobile', layout: 'mobile' }
    end
  end

  def home

    @benefits = Benefit.all
    @agent = request.env["HTTP_USER_AGENT"]

    @search = Provider.search(params[:q])
    @referral = Referral.new

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
        format.html   { render 'show', layout: 'inter' }
        format.mobile { render 'show_mobile', layout: 'mobile' }
      end
    else
      redirect_to action: :home
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
    @provider_attachment = @provider.provider_attachments.build
    @new_provider_attachment = @provider.provider_attachments.new
    @provider_attachments = @provider.provider_attachments.all

    @provider = Provider.find(params[:id])
    # @provider.pictures.build
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(all_provider_params)
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

  # PATCH/PUT /providers/1
  def update 
    @provider = Provider.find(params[:id])
    
    if @provider.update_attributes(all_provider_params)
      redirect_to root_path
    else
      format.html { render action: 'edit' }
    end 
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url }
      format.json { head :no_content }
    end
  end

  private

    def set_country
      @country = current_country
      redirect_to :action => :la_home if @country == nil
    end

    # Use callbacks to share common setup or constraints between actions.
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
