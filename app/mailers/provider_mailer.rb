class ProviderMailer < ActionMailer::Base
  default from: "\"Kmimos\" <contact@kmimos.la>" 
  
  def welcome_message(provider)
    @provider = provider
    mail(
      to: provider.email,
      subject: 'Bienvenido a Kmimos')
  end
end