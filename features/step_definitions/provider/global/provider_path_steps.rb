Then /^(?:|I )should be on the homepage$/ do
  current_path_is("/")
end

When /^I am on my provider edit page$/ do
  visit_and_assert(edit_provider_path(@provider))
end

When /^I go to my edit page$/ do
  visit_and_assert(edit_provider_path(@provider))
end

When /^I am on my provider fotos page$/ do
  visit_and_assert(my_pic_provider_path(@provider))
end

When /^I go to the provider sign up page$/ do
  category = create(:category)
  location = create(:location)
  visit(new_provider_path)
end

And /^I am on the homepage$/ do
  visit_and_assert(root_path)
end

And /^I am on my provider event show page$/ do
  visit_and_assert(event_show_path(@event))
end

And /^I am on my provider login page$/ do
  visit_and_assert(new_providers_session_path)
end

And /^I am on my provider time administration page$/ do
  visit_and_assert(time_administration_provider_path(@provider))
end

And /^I am on my provider set location page$/ do
  visit_and_assert(set_locations_provider_path(@provider))
end

And /^I am on the provider new page$/ do
  category = create(:category)
  location = create(:location)
  visit_and_assert(new_provider_path)
end


Then /^I should be on my provider dashboard page/ do
  current_path_is("/proveedores/#{@provider.url}/paneldecontrol")
end

Then /^I should be on my provider edit page$/ do
  current_path_is("/providers/#{@provider.id}/edit")
end

Then /^I should be on my provider fotos page$/ do
  current_path_is("/proveedores/#{@provider.url}/fotos")
end

Then /^I should be redirected to the provider signup page$/ do
  current_path_is("/providers")
end

Then /^I should be redirected to the provider login page$/ do
  current_path_is("/providers_sessions/new")
end  

Then /^I should be on the provider new password page$/ do
  current_path_is(new_providers_password_reset_path)
end

Then /^I should be on the provider signup page$/ do
  current_path_is("/providers")
end

Then /^I should be on the provider login page$/ do
  current_path_is("/providers_sessions/new")
end

Then /^I should be on my provider set locations page$/ do
  current_path_is(set_locations_provider_path(@provider))
end
