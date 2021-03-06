  class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy, :apply_to_new_version]
  before_action :require_current_provider, only: [:apply_to_new_version, :edit]
  before_action :require_unlogged_provider, only: [:new]
  before_action :get_dates, only: [:index]
  before_action :set_country, only: [:index,:home]



  # GET /providers
  # GET /providers.json
  def index

    @search = Provider.search(params[:q])

    @state_id = params[:states][:id]
    @location_id = params[:locations][:id] rescue nil

    state = State.find(@state_id)

    @providers = Location.find(@location_id).providers if @location_id.to_s != ''
    @providers = Provider.where(id: state.locations.map{|location| location.providers.map{|provider| provider.id}}.flatten) if @location_id.to_s == ''

    @providers = @providers.where(active: true)

    @providers = @providers.order(:id)

    @providers = @providers.paginate(:per_page => 20, :page => params[:page])
  end

  def apply_to_new_version
    @provider = current_provider
  end



  def home
    @search = Provider.search(params[:q])
    @referral = Referral.new
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
      redirect_to action: :home
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
      if @provider.update_attributes(provider_params)
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

  def update_state
    state = State.find(params[:country_id])
    @locations = state.locations rescue nil
    render partial: 'locations'
  end

  def ver_ultimos_cuidadores_inscritos
    @providers = Provider.where(active: true).order(id: :desc).paginate(:per_page => 20, :page => params[:page])
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
