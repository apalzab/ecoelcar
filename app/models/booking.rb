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

  before_create :set_price

  def set_price
    self.price = self.track.price
  end

  def update_price(old_price)
    self.track.bookings.each do |booking|
      if self.user.email != booking.user.email
        puts booking.user.email
        booking.price = self.price
        booking.save
        MailerService.booking_price_update_notification(booking.user.email, "", booking, old_price).deliver #notify other users about the new price
      end
    end
  end
end
