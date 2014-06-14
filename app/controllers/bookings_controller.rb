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
    @booking = current_user.bookings.create(booking_params)
    if @booking
      Track.find(booking_params[:track_id]).decrease_free_seats
      flash[:notice] = "#{current_user.name.capitalize}, acabas de hacer una reserva! Puedes acceder a todas tus reservas desde el área de Mis Reservas de la barra de navegación."
      # send confirmation emails
      MailerService.booking_confirmation_to_owner(current_user.email, "", @booking).deliver #user that has made the booking
      # calculate new price
      # there must be a worker that charges the users when they have done a route
      #notify other users about the new price
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
