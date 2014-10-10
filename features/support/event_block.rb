module EventBlock
  def create_event_block(location)
    select(location.street_address, from: 'location_id')
    select('60', from: 'event_size')
    page.execute_script("$('#start_day').val('13/3/2015')")
    page.execute_script("$('#start_hour_and_minute').val('1:00 PM')")
    page.execute_script("$('#end_hour_and_minute').val('3:00 PM')")
    click_on("Abrir bloque de tiempo")
  end
end
World(EventBlock)
