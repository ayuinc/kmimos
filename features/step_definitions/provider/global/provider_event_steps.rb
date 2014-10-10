Given /^an unbooked event$/ do
  business = create(:business)
  location = create(:location, business: business)
  @provider.locations << location
  subcategory = create(:subcategory)
  @provider.update_attribute(:subcategory_id, subcategory.id)
  @event = create(:event, provider: @provider, location: location, user_id: nil, phone_name: nil)
end

Given /^a booked event$/ do
  business = create(:business)
  location = create(:location, business: business)
  @provider.locations << location
  subcategory = create(:subcategory)
  @provider.update_attribute(:subcategory_id, subcategory.id)
  @user = create(:user)
  @event = create(:event, provider: @provider, location: location, user: @user, phone_name: nil)
end
