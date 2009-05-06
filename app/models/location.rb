class Location < ActiveRecord::Base
  has_many :events

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_uniqueness_of :name

  def to_s
    name
  end
end
