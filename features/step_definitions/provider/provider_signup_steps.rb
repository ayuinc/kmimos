When /^I submit correct provider information$/ do
  category = Category.first.name
  location = Location.first
  fill_in('provider[email]', with: @provider.email)
  fill_in('provider[email_c]', with: @provider.email)
  fill_in('provider[name]', with: @provider.name)
  fill_in('provider[dni]', with: @provider.dni)
  fill_in('provider[last_name_1]', with: @provider.last_name_1)
  fill_in('provider[last_name_2]', with: @provider.last_name_2)
  fill_in('provider[phone]', with: @provider.phone)
  fill_in('provider[price]', with: @provider.price)
  find("#location_#{location.id}").set(true)
  fill_in('provider[password]', with: @provider.password)
  fill_in('provider[password_confirmation]', with: @provider.password_confirmation)
  click_on("submit")
  # save_and_open_page
end


Then /^I should have successfully created a provider account$/ do
  provider = Provider.find_by_email(@provider.email)
  expect(provider).to be_true
end

When /^I submit mismatched passwords$/ do
  category = Category.first.name
  location = Location.first
  fill_in('provider[email]', with: @provider.email)
  fill_in('provider[name]', with: @provider.name)
  fill_in('provider[dni]', with: @provider.dni)
  fill_in('provider[last_name_1]', with: @provider.last_name_1)
  fill_in('provider[last_name_2]', with: @provider.last_name_2)
  find("#location_#{location.id}").set(true)
  fill_in('provider[password]', with: @provider.password)
  fill_in('provider[password_confirmation]', with: "wrongpassword")
  click_on("submit")
end

# When /^I don't check any locations$/ do
#   category = Category.first.name
#   location = Location.first
#   fill_in('provider[email]', with: @provider.email)
#   fill_in('provider[name]', with: @provider.name)
#   fill_in('provider[dni]', with: @provider.dni)
#   fill_in('provider[last_name_1]', with: @provider.last_name_1)
#   fill_in('provider[last_name_2]', with: @provider.last_name_2)
#   select(category, from: 'provider[category_id]')
#   fill_in('provider[password]', with: @provider.password)
#   fill_in('provider[password_confirmation]', with: @provider.password_confirmation)
#   click_on("submit")
# end

# When /^I submit a phone with letters$/ do
#   category = Category.first.name
#   location = Location.first
#   fill_in('provider[email]', with: @provider.email)
#   fill_in('provider[name]', with: @provider.name)
#   fill_in('provider[dni]', with: @provider.dni)
#   fill_in('provider[last_name_1]', with: @provider.last_name_1)
#   fill_in('provider[last_name_2]', with: @provider.last_name_2)
#   fill_in('provider[phone]', with: "aaavbbb")
#   fill_in('provider[price]', with: @provider.price)
#   select(category, from: 'provider[category_id]')
#   find("#location_#{location.id}").set(true)
#   fill_in('provider[password]', with: @provider.password)
#   fill_in('provider[password_confirmation]', with: @provider.password_confirmation)
#   click_on("submit")
# end

And /^I should see a passwords don't match error for provider$/ do
  page.should have_content("Confirmación de contraseña no coincide con la contraseña")
end

And /^I should see my provider name$/ do
  page.should have_content(@provider.name)
end

And /^I shouldn't see "Ya has ingresado"$/ do
  expect(page).to have_no_content('Ya has ingresado')
end

When /^I create a new provider account$/ do
  @location = create(:location)
  category = Category.first.name
  fill_in('provider[email]', with: "test@example.com")
  fill_in('provider[name]', with: @provider.name)
  fill_in('provider[dni]', with: @provider.dni)
  fill_in('provider[last_name_1]', with: @provider.last_name_1)
  fill_in('provider[last_name_2]', with: @provider.last_name_2)
  select(category, from: 'provider[category_id]')
  fill_in('provider[password]', with: "password")
  fill_in('provider[password_confirmation]', with: "password")
  click_on("submit")
end

Then /^I should see a welcome message and be on the homepage$/ do
  expect(page).to have_content("bienvenido a Servihogar.")
  current_path_is(root_path)
end

Then /^I should see a missing locations error message$/ do
  expect(page).to have_content("Ubicaciones no puede estar en blanco.")
#  current_path_is(root_path)
end

Then /^I should see a wrong phone format message$/ do
  expect(page).to have_content("Teléfono solo puede incluir números (0-9) y guiones")
#  current_path_is(root_path)
end

And /^I am logged out$/ do
  page.driver.remove_cookie("_servihogar_rails_session")
end

And /^I select a location$/ do
  find("#location_#{@location.id}").set(true)
  click_on("Actualizar lugares de trabajo")
end

Then /^I should have added that location$/ do
  expect(Provider.first.locations).to eq([@location])
end
