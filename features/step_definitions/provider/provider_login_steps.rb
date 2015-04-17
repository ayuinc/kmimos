When /^I login with valid provider credentials$/ do
  fill_in('provider_login_dni', with: @provider.dni)
  fill_in('provider_login_password', with:@provider.password)
  click_on("provider_login_button")
end

When /^I login with invalid provider credentials$/ do
  fill_in('provider_login_dni', with: @provider.dni)
  fill_in('provider_login_password', with:"xxxx")
  click_on("provider_login_button")
end

And /^I should see a wrong password dni combination$/ do
  expect(page).to have_content("IFE o contraseña inválidos.")
end