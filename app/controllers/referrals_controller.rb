class ReferralsController < ApplicationController
  before_action :set_referral, only: [:show, :destroy]

  # GET /referrals
  # GET /referrals.json
  def index
    @referrals = Referral.all
  end

  # GET /referrals/1
  # GET /referrals/1.json
  def show
  end

  # GET /referrals/new
  def new
    @referral = Referral.new
  end

  # POST /referrals
  # POST /referrals.json
  def create
    @referral = Referral.new(referral_params)

    respond_to do |format|
      if @referral.save
        session[:code_id] = @referral.id
        format.html { redirect_to @referral, notice: 'Person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @referral }
        format.js { render action: 'show', status: :created, location: @referral }
      else
        format.html { render action: 'new' }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
        format.js { render json: @referral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referrals/1
  # DELETE /referrals/1.json
  def destroy
    @referral.destroy
    respond_to do |format|
      format.html { redirect_to referrals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral
      @referral = Referral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referral_params
      params.require(:referral).permit(:code_value, :referrer_name, :referrer_email)
    end
end
