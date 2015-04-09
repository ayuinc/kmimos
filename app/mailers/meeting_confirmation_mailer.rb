class MeetingConfirmationMailer < ActionMailer::Base
  default from: "\"Kmimos\" <reservas@cani.mx>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.business_mailer.new_record_notification.subject
  #
  def new_meeting_notification(meeting)
    @meeting = meeting
    mail(
      to: @meeting.user_email,
      subject: 'Solicitud recibida.')
  end

  def new_meeting_for_admin(meeting)
    @meeting = meeting
    mail(
      to: "adelrio@ayuinc.com",
      # to: "robcuevas@desdigitec.com",
      # cc: "r.gonzalez@desdigitec.com",
      subject: 'Nueva solicitud en Kmimos')
  end
end
