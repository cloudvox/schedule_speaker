class ScheduleParser
  def initialize(filename)
    @filename = filename
  end

  def parse
    cal_file = File.open @filename
    # Parser returns an array of calendars because a single file
    # can have multiple calendars.
    cals = Icalendar.parse(File.open("/home/troy/ical"))
    cals.first.events
  end
end
