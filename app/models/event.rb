class Event < ActiveRecord::Base
  belongs_to :location

  validates_presence_of :starts_at, :summary, :location
  validates_length_of :summary, :url, :maximum => 255

  def self.occurring_at(time_wanted)
    Event.find :all, :conditions => [ "starts_at <= ? and ends_at >= ?", 
      time_wanted, time_wanted ]
  end
end
