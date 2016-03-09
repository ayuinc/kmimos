class MeetingConfirmationMailer < ActionMailer::Base
  default from: "\"Kmimos\" <contacto@kmimos.la>"


  def new_meeting_notification(meeting, current_country)
    @meeting = meeting
    @country = current_country
    mail(
      to: [ @meeting.user_email,"r.gonzalez@desdigitec.com", "e.celli@desdigitec.com", "m.castellon@desdigitec.com" ],
      subject: 'Solicitud para conocer cuidador Kmimos recibida')
  end

  def new_meeting_provider_notification(meeting, current_country)
    @meeting = meeting
    @country = current_country
    mail(
      to: @meeting.provider.email,
      subject: 'Tienes una solicitud para conocerte en Kmimos')
  end

  def new_meeting_for_admin(meeting, current_country)

    @meeting = meeting     
    @country = current_country
    admins = []
    admins << "r.gonzalez@desdigitec.com" << "e.celli@desdigitec.com" << "f.trujillo@desdigitec.com" << "m.castellon@desdigitec.com"
    
    # Panamá
    if @country.id == 3
      admins << "nenavieira@gmail.com" << "bobthin@gmail.com"
    end
    
    mail(
      to: "r.cuevas@desdigitec.com",
      cc: admins, 
      subject: 'Conocer en persona - Nueva solicitud. Kmimos ' + @country.name)
 
  end
end
