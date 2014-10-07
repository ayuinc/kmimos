When /^I book an appointment for an unregistered user$/ do
  click_on("#{@event.start_time.strftime('%l:%M').strip} - #{@event.end_time.strftime('%l:%M').strip}")
  fill_in("phone_name", with: "MyString")
  click_on("Listo, sacar cita")
end

When /^I book an appointment for an unregistered user including their email$/ do
  click_on("#{@event.start_time.strftime('%l:%M').strip} - #{@event.end_time.strftime('%l:%M').strip}")
  fill_in("phone_name", with: "MyString")
  fill_in("email_phone_name", with: "name@mail.com")
  click_on("Listo, sacar cita")
end

Then /^the event should be booked$/ do
  current_path_is(dashboard_provider_es_path(@provider))
  expect(Event.last.phone_name).to eq("MyString")
end

And /^a confirmation mail and reminder should be sent$/ do
  expect(ActionMailer::Base.deliveries.count).to eq(2)
end

And /^I should see the event on my dashboard$/ do
  expect(page).to have_content(@event.phone_name)
end   
