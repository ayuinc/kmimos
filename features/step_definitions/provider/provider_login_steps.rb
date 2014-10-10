When /^I login with valid provider credentials$/ do
  fill_in('email', with: @provider.email)
  fill_in('password', with:@provider.password)
  click_on("provider_login_button")
end

When /^I login with invalid provider credentials$/ do
  fill_in('email', with: @provider.email)
  fill_in('password', with:"xxxx")
  click_on("provider_login_button")
end

And /^I should see a please wrong password email combination$/ do
  expect(page).to have_content("Correo electrónico o contraseña inválidos.")
end