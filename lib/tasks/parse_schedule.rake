desc 'Parse RailsConf schedule Web page and generate model instances'
task :parse_schedule => :environment do
  s = ScheduleParser.new ENV['FILENAME']
  events = s.parse

  events.each do |event|
    puts "start date-time: " + event.dtstart.to_s
    puts "summary: " + event.summary.to_s
  end
end
