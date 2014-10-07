module TimeSpecHelper
  def event_start_time(offset=0)
    DateTime.now.beginning_of_hour + 1.hour + offset.hour
  end

  def event_end_time(offset=0)
    DateTime.now.end_of_hour + 1.hour + offset.hour
  end
end

World(TimeSpecHelper)
