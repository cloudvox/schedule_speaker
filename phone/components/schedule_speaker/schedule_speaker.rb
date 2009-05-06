methods_for :dialplan do
  def schedule_speaker
    ScheduleSpeaker.new(self).start
  end
end

class ScheduleSpeaker
  def start
    2.times do
      say_events Event.occuring_at(10.minutes)

      sleep 2
      speak "This event list will now repeat."
      sleep 2
    end
  end

  def say_events(events)
    events.each do |event|
      speak "The session #{event}."
      sleep 1
    end
  end

  def speak(phrase)
    # specify text-to-speech system and send as quoted phrase
    @call.execute 'swift', "\"#{phrase}\""
  end
end
