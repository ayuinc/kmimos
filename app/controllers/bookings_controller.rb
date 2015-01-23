class BookingsController < ApplicationController
	# before_action :get_dates, only: [:new]
	# before_action :check_booking_params, only: [:new]

	def new
		session[:chosen_provider_id] = params[:provider_id]
	  @booking = Booking.new
	  # @chosen_provider = Provider.find(params[:provider_id])
	end

	def create 
		@booking = Booking.new(booking_params)
	  if @booking.save
    	BookingConfirmationMailer.new_booking_notification(@booking).deliver
    	flash[:success] = 'Reserva realizada. Te hemos enviado un correo de confirmación.'
	    session[:start_date] = nil
	    session[:end_date] = nil
      session[:user_email] = @booking.user_email
	    redirect_to  pages_thank_you_path
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
	  params.require(:booking).permit(:start_date, :end_date, :user_first_name, :user_last_name, :provider_id, :user_phone, :user_email, :ref_code, :user_message)
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