When /^I visit another provider's edit page$/ do
  @another_provider = create(:provider)
  visit("/providers/#{@another_provider.id}/edit")
end

Then /^I should be redirected to the homepage$/ do
  current_path_is(root_path)
end