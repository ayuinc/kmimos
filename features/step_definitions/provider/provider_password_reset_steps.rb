When /^I reset my provider password$/ do
  visit("/providers_password_resets/new")
  fill_in('reset_password', with: @provider.email)
  click_on('Resetear mi contraseña')
end

When /^I attempt to reset my password$/ do
  visit("/providers_password_resets/new")
end

And /^I choose a new provider password$/ do
  fill_in("provider_password", with: "foobar")
  fill_in("provider_password_confirmation", with: "foobar")
  click_on("Reestablecer contraseña")
end

And /^I follow the link in my provider reset email$/ do
  email = ActionMailer::Base.deliveries.last.body
  reset_link = email.match(/http:\/\/localhost:3000(......................................................)/).captures.first.to_s.strip
  visit(reset_link)
  current_path_is(reset_link)
end

When /^I reset my provider password twice$/ do
  visit("/providers_password_resets/new")
  fill_in('reset_password', with: @provider.email)
  click_on('Resetear mi contraseña')
  @first_email = ActionMailer::Base.deliveries.last.body
  visit("/providers_password_resets/new")
  fill_in('reset_password', with: @provider.email)
  click_on('Resetear mi contraseña')
end

And /^I follow the link in the first provider reset email$/ do
  reset_link = @first_email.match(/http:\/\/localhost:3000(......................................................)/).captures.first.to_s.strip
  visit(reset_link)
end


And /^I follow the link in my provider reset email after it expired$/ do
  Timecop.travel(DateTime.now + 1.day) do
    email = ActionMailer::Base.deliveries.last.body
    reset_link = email.match(/http:\/\/localhost:3000(......................................................)/).captures.first.to_s.strip
    visit(reset_link)
    current_path_is(new_providers_password_reset_path)
  end
end
