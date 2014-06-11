class BookingsController < ApplicationController
  def index
    if is_owner?
      @bookings = current_user.bookings.recents
      @tracks = current_user.tracks.recents
    end
  end

  def new
    @track = Track.find(params[:track_id])
  end

  def create
    Booking.create(booking_params)
  end

  def is_owner?
    if current_user.id != User.friendly.find(params[:user_id]).id.to_i
      flash[:notice] = "Can't access to that place"
      redirect_to root_path
    else true
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:track_id)
  end
end
