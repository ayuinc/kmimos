class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :require_current_provider, only: [:edit]
  before_action :get_ranges, only: [:edit, :new]
  before_action :require_unlogged_provider, only: [:new]


  # GET /providers
  # GET /providers.json
  def index

  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  @search = Provider.search(params[:q])
    unless (params.has_key?(:locations_id_eq) || params.has_key?(:category_id_eq))
      @providers = @category.providers
    else
      @providers = @search.result
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name, :last_name_1, :last_name_2, :dni, :email, :category_id, :password, :password_confirmation, locations_attributes: [:id], location_ids: [])
    end

end
