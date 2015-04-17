Given /^a provider without an account$/ do
  @provider = build(:provider)
end

Given /^an unlogged provider$/ do
  @provider = create(:provider)
end

Given /^a logged in provider$/ do
  @provider = create(:provider)
  login(@provider)
end

Given /^a provider with a complete profile$/ do
  @provider = create(:provider)
  @provider.locations << @location
  login(@provider)
end

#Given /^a provider with an unbooked event$/ do
  #business = create(:business)
  #@location = create(:location, business: business)
  #@provider = create(:provider, locations: [@location])
  #@event = create(:event, location: @location, provider: @provider)
  #login(@provider)
#end
