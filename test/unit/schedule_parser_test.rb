require 'test_helper'

class ScheduleParserTest < ActiveSupport::TestCase
  test "parses representative data" do
    parser = ScheduleParser.new File.join(Rails.root, %w(test fixtures raw_event_data.ica))
    parser.import_events!

    assert_equal 7, Event.count
    assert_equal 5, Location.count
    assert Event.find_by_summary('A Hat Full of Tricks with Sinatra')
    assert Location.find_by_name('Ballroom B')
  end
end
