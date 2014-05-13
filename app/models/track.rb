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
#

class Track < ActiveRecord::Base
  has_one :origin_station, class_name: Station
  has_one :destination_station, class_name: Station

  belongs_to :user

  validates :origin_station_id, :destination_station_id, :route_spots, :datetime, presence: true

end
