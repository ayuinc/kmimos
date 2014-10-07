When /^I submit a provider event information$/ do
  select(@location.street_address, from: 'location_id')
  select('60', from: 'event_size')
  page.execute_script("$('#start_day').val('13/3/2015')")
  page.execute_script("$('#end_day').val('13/3/2015')")
  page.execute_script("$('#start_hour_and_minute').val('1:00 PM')")
  page.execute_script("$('#end_hour_and_minute').val('3:00 PM')")
  click_on("Abrir bloque de tiempo")
end

Then /^I should see 2 events$/ do
  expect(Event.count).to eq(2)
end

When /^I create a weekday repeating event$/ do
  select(@location.street_address, from: 'location_id')
  select('60', from: 'event_size')
  page.execute_script("$('#start_day').val('13/3/2015')")
  page.execute_script("$('#start_hour_and_minute').val('1:00 PM')")
  page.execute_script("$('#end_hour_and_minute').val('3:00 PM')")
  select('Diariamente', from: 'repeats')
  page.execute_script("$('#end_day').val('19/3/2015')")
  click_on("Abrir bloque de tiempo")
end

Then /^I should see a weeks worth of events$/ do
  expect(Event.count).to eq(10)
end

When /^I create a weekly repeating event$/ do
  select(@location.street_address, from: 'location_id')
  select('60', from: 'event_size')
  page.execute_script("$('#start_day').val('13/3/2015')")
  page.execute_script("$('#start_hour_and_minute').val('1:00 PM')")
  page.execute_script("$('#end_hour_and_minute').val('3:00 PM')")
  select('Semanalmente', from: 'repeats')
  page.execute_script("$('#end_day').val('20/3/2015')")
  click_on("Abrir bloque de tiempo")
end

Then /^I should see all weekly events$/ do
  expect(Event.count).to eq(4)
end


When /^I create a montly repeating event$/ do
  select(@location.street_address, from: 'location_id')
  select('60', from: 'event_size')
  page.execute_script("$('#start_day').val('13/3/2015')")
  page.execute_script("$('#start_hour_and_minute').val('1:00 PM')")
  page.execute_script("$('#end_hour_and_minute').val('3:00 PM')")
  select('Mensualmente', from: 'repeats')
  page.execute_script("$('#end_day').val('20/3/2015')")
  click_on("Abrir bloque de tiempo")
end

Then /^I should see all monthly events$/ do
  expect(Event.count).to eq(2)
end

When /^I try to create an event in the past$/ do
  select(@location.street_address, from: 'location_id')
  select('60', from: 'event_size')
  page.execute_script("$('#start_day').val('13/3/2012')")
  page.execute_script("$('#end_day').val('13/3/2012')")
  page.execute_script("$('#start_hour_and_minute').val('1:00 PM')")
  page.execute_script("$('#end_hour_and_minute').val('3:00 PM')")
  click_on("Abrir bloque de tiempo")
end

Then /^I should see an invalid provider event error message$/ do
  expect(Event.count).to eq(0)
  expect(page).to have_content("Slot no puede estar en el pasado.")
  current_path_is("/proveedores/#{@provider.url}/administrartiempo")
end

When /^I try to create events of size 0$/ do
  select(@location.street_address, from: 'location_id')
  select('60', from: 'event_size')
  page.execute_script("$('#start_day').val('13/3/2015')")
  page.execute_script("$('#start_hour_and_minute').val('1:00 PM')")
  page.execute_script("$('#end_hour_and_minute').val('1:00 PM')")
  select('Diariamente', from: 'repeats')
  page.execute_script("$('#end_day').val('19/3/2015')")
  click_on("Abrir bloque de tiempo")
end

Then /^I should see an event cannot be size 0 error$/ do
  expect(Event.count).to eq(0)
  expect(page).to have_content("El slot de tiempo no puede empezar y terminar al mismo tiempo.")
end

When /^I try to create indivisible blocks of time$/ do
  select(@location.street_address, from: 'location_id')
  select('90', from: 'event_size')
  page.execute_script("$('#start_day').val('13/3/2015')")
  page.execute_script("$('#start_hour_and_minute').val('1:00 PM')")
  page.execute_script("$('#end_hour_and_minute').val('2:00 PM')")
  select('Diariamente', from: 'repeats')
  page.execute_script("$('#end_day').val('19/3/2015')")
  click_on("Abrir bloque de tiempo")
end

Then /^I should see a blocks must be divisible error$/ do
  expect(Event.count).to eq(0)
  expect(page).to have_content("El slot de tiempo que has elegido no es divisible en blocks de 90 minutos.")
end
