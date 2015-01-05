class BookingsController < ApplicationController
	# before_action :get_dates, only: [:new, :create]

	def new
	  @booking = Booking.new
	end

	def create 
		@booking = Booking.new(booking_params)
	  if @booking.save
    	flash[:success] = 'Reserva realizada. Te hemos enviado un correo de confirmación.'
	    session[:start_date] = nil
	    session[:end_date] = nil
	    redirect_to root_path
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
	  params.require(:booking).permit(:start_date, :end_date, :user_first_name, :provider_id)
	end

	# def get_dates
	#   # @start_date = Date.strptime(params[:start_date],'%m/%d/%Y')
	#   # @end_date = Date.strptime(params[:end_date],'%m/%d/%Y')
	# end

	# def assign_dates
	# 	@booking.start_date = Date.strptime('04/30/2013','%m/%d/%Y')
	# 	@booking.end_date = Date.strptime('04/30/2014','%m/%d/%Y')
	# end

end