class BookingsController < ApplicationController
	before_action :set_booking, only: [:show]
	# before_action :check_booking_params, only: [:new]

	def new
		session[:chosen_provider_id] = params[:provider_id]
	  @booking = Booking.new
	  # @chosen_provider = Provider.find(params[:provider_id])
	end

	def show
	end

	def create 
		@booking = Booking.new(booking_params)
	  if @booking.save
    	BookingConfirmationMailer.new_booking_notification(@booking).deliver
    	BookingConfirmationMailer.new_booking_for_admin(@booking).deliver
	    session[:start_date] = nil
	    session[:end_date] = nil
      session[:user_email] = nil
	    redirect_to booking_path(@booking)
	  else
	    render 'new'
	  end
	end

	def update
	  respond_to do |format|
	    if @booking.update(booking_params)
	    #  format.html { redirect_to root_path, notice: 'Tu perfil se ha actualizado con éxito' }
	      format.html { redirect_to root_path }
	      format.json { head :no_content }
	    else
	      format.html { render action: 'edit' }
	      format.json { render json: @booking.errors, status: :unprocessable_entity }
	    end
	  end
	end

	private

	def booking_params
	  params.require(:booking).permit(:raza, :edad, :cuidado_especial, :start_date, :end_date, :user_first_name, :user_last_name, :provider_id, :user_phone, :user_email, :ref_code, :user_message, :address, :pickup_time, :dropoff_time, :pet_name)
	end

	def set_booking
    @booking = Booking.find_by_token(params[:id])
  end

	def get_dates
	  unless params[:start_date].nil? || params[:start_date].empty?
	    session[:start_date] = Date.strptime(params[:start_date],'%d/%m/%Y')
	  end
	  unless params[:start_date].nil? || params[:start_date].empty?
	    session[:end_date] = Date.strptime(params[:end_date],'%d/%m/%Y')
	  end
	end

end