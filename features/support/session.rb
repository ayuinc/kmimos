module SessionSteps
  def login(subject)
    if subject.kind_of?(Provider)
      visit("/providers_sessions/new")
      fill_in("provider_login_email", with: subject.email)
      fill_in("provider_password_email", with: subject.password)
      click_on("provider_login_button")
    end
  end

  def logout
    visit("/")
    click_on("logout")
  end
end
World(SessionSteps)
