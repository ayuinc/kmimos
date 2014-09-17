module MailerSteps

  def mailers
    ActionMailer::Base.deliveries
  end

  def mailers_count
    ActionMailer::Base.deliveries.count
  end

  def last_mailer
    ActionMailer::Base.deliveries.last
  end

  def first_mailer 
    ActionMailer::Base.deliveries.first
  end
end

World(MailerSteps)
