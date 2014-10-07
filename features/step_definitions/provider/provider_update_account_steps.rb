When /^I update my provider category$/ do
  @category = Category.last
  select(@category.name, from: 'provider[category_id]')
  click_on("submit")
end

When /^I update my provider dni$/ do
  fill_in('provider[dni]', with: "45818351")
  click_on("submit")
end

Then /^I should have successfully updated my provider category$/ do
  current_path_is provider_path(@provider)
  provider = Provider.find(@provider.id)
  expect(provider.category.name).to eq(@category.name)
end

Then /^I should have successfully updated my provider dni$/ do
  current_path_is provider_path(@provider)
  provider = Provider.find(@provider.id)
  expect(provider.dni).to eq("45818351")
end
