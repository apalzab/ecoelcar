class BookingsController < ApplicationController
  def index
    if is_owner?
      @bookings = current_user.bookings.recents
      @tracks = current_user.tracks.recents
    end
  end

  def new
  end

  def is_owner?
    if current_user.id != User.friendly.find(params[:user_id]).id.to_i
      flash[:notice] = "Can't access to that place"
      redirect_to root_path
    else true
    end
  end
end
