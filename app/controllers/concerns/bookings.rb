module Bookings

  def check_booking_params
    redirect_to providers_path unless !session[:start_date].nil? && !session[:end_date].nil?
    flash[:error] = "Por favor selecciona fecha de check-in, fecha de check-out y al cuidador de tu preferencia."
  end
end
