# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  price      :float
#  user_id    :integer
#  track_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  scope :recents, -> { order('created_at ASC') }
end
