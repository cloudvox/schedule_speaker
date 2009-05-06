class Event < ActiveRecord::Base
  belongs_to :location

  validates_presence_of :starts_at, :summary, :location
  validates_length_of :summary, :url, :maximum => 255
end
