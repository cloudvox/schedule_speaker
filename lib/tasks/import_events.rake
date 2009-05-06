desc 'Parse ical file (in FILENAME) and generate model instances'
task :import_events => :environment do
  puts "Starting with #{Event.count} events."

  s = ScheduleParser.new ENV['FILENAME']
  s.import_events!

  puts "Now #{Event.count} events."
end
