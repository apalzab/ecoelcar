# == Schema Information
#
# Table name: tracks
#
#  id                     :integer          not null, primary key
#  user_id                :integer
#  origin_station_id      :integer
#  destination_station_id :integer
#  datetime               :datetime
#  route_spots            :text
#  created_at             :datetime
#  updated_at             :datetime
#  free_seats             :integer
#  distance               :float
#

class Track < ActiveRecord::Base
  has_one :origin_station, class_name: Station
  has_one :destination_station, class_name: Station
  has_many :bookings
  belongs_to :user

  before_save :set_price

  validates :origin_station_id, :destination_station_id, :route_spots, :datetime, presence: true

  scope :with_free_seats, -> { where('free_seats >= 1') }
  scope :active, -> { where('datetime > ?', DateTime.now) }
  scope :recents, -> { order('datetime ASC') }

  proc { validated_challenges.where() }

  def is_active
    self.datetime > DateTime.now
  end

  def decrease_free_seats
    self.free_seats -= 1
    self.save
  end

  def set_price
    if self.distance < 1000
      self.price = 1
    elsif
      self.price = 1 + ( (self.distance/1000) * 0.05 )
    end
    self.price = self.price * (self.free_seats.to_f/self.user.vehicles.first.seats.to_f)
  end
end
