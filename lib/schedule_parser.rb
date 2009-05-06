class ScheduleParser
  def initialize(filename)
    @filename = filename
  end

  def import_events!
    events.each do |event|
      next if event.location.blank? or event.dtstart.blank?
      location = Location.find_or_create_by_name event.location
      location.events.create! :starts_at => event.dtstart, :ends_at => event.dtend,
        :summary => event.summary, :description => event.description,
        :url => event.url.to_s
    end
  end

  private
  def events
    cals = Icalendar.parse(File.open(@filename))
    cals.first.events
  end
end
