class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  before_action :require_current_provider, only: [:edit]
  before_action :get_ranges, except: [:show]
  before_action :require_unlogged_provider, only: [:new]


  # GET /providers
  # GET /providers.json
  def index
    @search = Provider.search(params[:q])
    @providers = @search.result
  end

  def home
  end  

  # GET /providers/1
  # GET /providers/1.json
  def show
    respond_to do |format|
        format.html # show.html.erb
        format.js # show.js.erb
        format.json { render json: @provider }
    end
  end

  # GET /providers/new
  def new
    @provider = Provider.new
    @provider.pictures.build
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)
      if @provider.save
        session[:provider_id] = @provider.id
        flash.now[:success] = "Hola #{@provider.name}, bienvenido a Servihogar."
        redirect_to root_path
      else
       render "new"
       #redirect_to new_provider_path
      end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
      #  format.html { redirect_to root_path, notice: 'Tu perfil se ha actualizado con éxito' }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name, :last_name_1, :last_name_2, :dni, :email, :email_c, :phone, :avg_rating, :category_id, :password, :password_confirmation, locations_attributes: [:id], location_ids: [], pictures_attributes:[:image,  :id, :imageable_id, :imageable_type])
    end

    def get_ranges
      sets = Location.all.in_groups(3, false)
      @locations_set_1 = sets[0]
      @locations_set_2 = sets[1]
      @locations_set_3 = sets[2]
    end
end
