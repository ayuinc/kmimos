class MeetingsController < ApplicationController
	# before_action :get_dates, only: [:new]
	# before_action :check_booking_params, only: [:new]

	def new
		session[:chosen_provider_id] = params[:provider_id]
	  @meeting = Meeting.new
	  # @chosen_provider = Provider.find(params[:provider_id])
	end

	def create 
		@meeting = Meeting.new(meeting_params)
	  if @meeting.save
    	MeetingConfirmationMailer.new_meeting_notification(@meeting).deliver
    	MeetingConfirmationMailer.new_meeting_for_admin(@meeting).deliver
    	flash[:success] = 'Reserva realizada. Te hemos enviado un correo de confirmación.'
	    session[:start_date] = nil
	    session[:end_date] = nil
      session[:user_email] = @meeting.user_email
	    redirect_to  pages_thank_you_meeting_path
	  else
	    render 'new'
	  end
	end

	def update
	  respond_to do |format|
	    if @meeting.update(meeting_params)
	    #  format.html { redirect_to root_path, notice: 'Tu perfil se ha actualizado con éxito' }
	      format.html { redirect_to root_path }
	      format.json { head :no_content }
	    else
	      format.html { render action: 'edit' }
	      format.json { render json: @meeting.errors, status: :unprocessable_entity }
	    end
	  end
	end

	private

	def meeting_params
	  params.require(:meeting).permit(:user_first_name, :user_last_name, :provider_id, :user_phone, :user_email)
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