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
    old_price = Booking.where(track_id: booking_params[:track_id]).last.price rescue ActiveRecord::RecordNotFound
    @booking = current_user.bookings.create(booking_params)
    if @booking
      Track.find(booking_params[:track_id]).decrease_free_seats
      flash[:notice] = "#{current_user.name.capitalize}, acabas de hacer una reserva! Puedes acceder a todas tus reservas desde el área de Mis Reservas de la barra de navegación."
      MailerService.booking_confirmation(current_user.email, "", @booking).deliver #user that has made the booking
      @booking.update_price(old_price)
    end
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
