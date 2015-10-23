  class ProvidersController < ApplicationController
    
  before_action :set_provider, only: [:show, :edit, :update, :destroy] 
  #before_action :require_unlogged_provider, only: [:new]
  before_action :get_dates, only: [:index]
  before_action :set_country, only: [:index,:home]

  # GET /providers
  # GET /providers.json
  
  def index
    @search = Provider.search(params[:q])
    if (params[:q] != nil and params[:q][:locations_id_eq] != "") 
      @providers = @search.result
      .joins('LEFT OUTER JOIN "states" ON "states"."id" = "locations"."state_id" 
             LEFT OUTER JOIN "countries" ON "countries".id = "states"."country_id"')
      .where('"countries"."id" = ? and "providers".active = ?',current_country.id,true).order("last_name_1 DESC")
    else
      @providers = Provider.select("providers.*")
      .joins('LEFT OUTER JOIN "localizations" on "localizations"."provider_id" = "providers"."id"
              LEFT OUTER JOIN "locations" on "locations".id = "localizations"."location_id"
              LEFT OUTER JOIN "states" ON "states"."id" = "locations"."state_id" 
              LEFT OUTER JOIN "countries" ON "countries".id = "states"."country_id"')
      .where('"countries"."id" = ? and "providers".active = ?',current_country.id,true).order("last_name_1 DESC")
      .distinct
    end
    #if params[:direction] != nil
    #  @providers = @providers.order("price " + params[:direction])
    #endx`
    @providers = @providers.all.page params[:page]
  end

  def home 
    @search = Provider.search(params[:q])
    @referral = Referral.new
    
    render 'home', layout: 'home'
  end
  
  def la_home
    @countries = Country.all
    render :layout => "inter"
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    if @provider.active 
      @provider_attachments = @provider.provider_attachments.all
    else
      redirect_to :home 
    end
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
    @provider = Provider.new(provider_params)
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
    respond_to do |format|
      if @provider.update(all_provider_params)
        unless params[:provider_attachments].nil?
          params[:provider_attachments]['photo'].each do |a|
             @provider_attachment = @provider.provider_attachments.create!(:photo => a, :provider_id => @provider.id)
          end
        end
        format.html { redirect_to root_path }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
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
      params.require(:user).permit!
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

    def get_dates
      unless params[:start_date].nil? || params[:start_date].empty?
        session[:start_date] = Date.strptime(params[:start_date],'%d/%m/%Y')
      end
      unless params[:end_date].nil? || params[:end_date].empty?
        session[:end_date] = Date.strptime(params[:end_date],'%d/%m/%Y')
      end
    end
    
    
end
