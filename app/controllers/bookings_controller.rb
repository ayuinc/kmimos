class BookingsController < ApplicationController
	before_action :set_booking, only: [:show]
  before_action :authenticate_user!, except: [:booking_resume]

  def index
    @bookings = Booking.where(user_id: current_user)

  end

	def get_pdf

	end

	def booking_resume
		@booking = Booking.find(params[:booking_id])

		render :booking_resume, layout: false
	end

	def new
    @services =  params[:services] != nil ? Service.where(id: params[:services]) : []
		@provider = Provider.find(params[:booking][:provider_id])
	  @booking = Booking.new
    @booking.start_date = session[:from_date]
    @booking.end_date = session[:to_date]
	end

	def show
    @booking = Booking.where(token: params[:id]).last
	end

	def create

    @provider = Provider.find(params[:provider_id])
		@booking = Booking.new(booking_params)

    @booking.provider_id  = @provider.id
    @booking.user_id = current_user.id

	  if @booking.save

    	BookingConfirmationMailer.new_booking_notification(@booking, current_country).deliver
      BookingConfirmationMailer.new_booking_provider_notification(@booking, current_country).deliver
    	#BookingConfirmationMailer.new_booking_for_admin(@booking, current_country).deliver

	    session[:from_date], session[:to_date] = nil, nil
	    redirect_to booking_path(@booking)
	  else
	    render 'new'
	  end
	end

	private

	def booking_params
	  params.require(:booking).permit! #(:raza, :edad, :cuidado_especial, :start_date, :end_date, :user_first_name, :user_last_name, :provider_id, :user_phone, :user_email, :ref_code, :user_message, :address, :pickup_time, :dropoff_time, :pet_name)
	end

	def set_booking
    @booking = Booking.find_by_token(params[:id])
  end



end
