require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "finds correct events" do
    # co-dependent test is not ideal
    parser = ScheduleParser.new File.join(Rails.root, %w(test fixtures raw_event_data.ica))
    parser.import_events!

    assert_equal 0, Event.occurring_at(Time.parse('20090504T082959')).size
    assert_equal 5, Event.occurring_at(Time.parse('20090504T083000')).size
  end
end
