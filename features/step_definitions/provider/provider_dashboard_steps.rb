Given /^user booked events$/ do
  user = create(:user)
  @user_booked_events = create(:event,
                               user: user,
                               location: @location,
                               provider: @provider,
                               phone_name: nil)
end

And /^phone name booked events$/ do
  @phone_name_booked_events = create(:event,
                                     start_time: event_start_time(1),
                                     end_time: event_end_time(1),
                                     location: @location,
                                     provider: @provider,
                                     user_id: nil,
                                     phone_name: "Andrea Del Rio")
end

Then /^I should see all my events$/ do
  events = Event.all
  events.each do |event|
    expect(page).to have_content(event.start_time.strftime('%H:%M'))
  end
end
