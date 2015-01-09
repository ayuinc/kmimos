class ReferralsController < ApplicationController
  before_action :set_referral, only: [:show, :edit, :update, :destroy]

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

  # GET /referrals/1/edit
  def edit
  end

  # POST /referrals
  # POST /referrals.json
  def create
    @referral = Referral.new(referral_params)

    respond_to do |format|
      if @referral.save
        format.html { redirect_to @referral, notice: 'Referral was successfully created.' }
        format.json { render action: 'show', status: :created, location: @referral }
        # added:
        format.js   { render action: 'show', status: :created, location: @referral }
      else
        format.html { render action: 'new' }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @referral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referrals/1
  # PATCH/PUT /referrals/1.json
  def update
    respond_to do |format|
      if @referral.update(referral_params)
        format.html { redirect_to @referral, notice: 'Referral was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
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
      params.require(:referral).permit(:code, :referrer_name, :referrer_email)
    end
end
