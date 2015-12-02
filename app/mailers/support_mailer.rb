class SupportMailer < ActionMailer::Base
  default from: "\"Kmimos\" <support@cani.mx>"
  
  
  def new_booking_notification(provider, params)
    @provider = provider
    @params = params
    mail(
      to: 'lalo@laboratoria.la',
      subject: 'Ha ocurrido un error')
  end
  
end