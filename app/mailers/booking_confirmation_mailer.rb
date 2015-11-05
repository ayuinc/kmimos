class BookingConfirmationMailer < ActionMailer::Base
  #default from: "\"Kmimos\" <reservas@cani.mx>" 
  default from: "\"Kmimos\" <lalo@laboratoria.la>" 

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.business_mailer.new_record_notification.subject
  #
  def new_booking_notification(booking, current_country) 
    @booking = booking
    @country = current_country
    
    mail(
      to: @booking.user.email,
      subject: 'Reserva realizada.')
  end
  
  def new_booking_for_admin(booking, current_country)
    @booking = booking
    @country = current_country
    admins = []
    #admins << "r.gonzalez@desdigitec.com" << "e.celli@desdigitec.com"
    admins << "lalo@laboratoria.la" << "lalo@laboratoria.la"
    # Panamá
    if @country.id == 3
      admins << "lalo@laboratoria.la" << "lalo@laboratoria.la"
      #admins << "nenavieira@gmail.com" << "bobthin@gmail.com"
    end
 
    admins << @booking.provider.email
    p admins
    mail(
      to: "lalo@laboratoria.la", #to: "r.cuevas@desdigitec.com",
      cc: admins,
      subject: 'Nueva reserva en Kmimos ' + @country.name)
 
  end
  
  def new_booking_provider_notification(booking, current_country) 
    @booking = booking
    @country = current_country
    
    mail(
      to: @booking.provider.email,
      subject: 'Reserva realizada.')
  end
end
