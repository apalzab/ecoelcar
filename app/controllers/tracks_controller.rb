class TracksController < ApplicationController
require 'will_paginate/array'

  before_action :check_profile, only: [:new]

  def index
    @q = Track.search(params[:q])
    @tracks = @q.result(distinct: true).active.recents.paginate(:page => params[:page], :per_page => 6)
  end

  def create
    if current_user.tracks.create(track_params)
      MailerService.track_publication_send_confirmation(current_user.email, "", current_user.tracks.last).deliver
    end
    @track = current_user.tracks.last
    redirect_to @track
  end

  def show
    @track = Track.find(params[:id])
  end

  private
  def track_params
    params.require(:track).permit(:origin_station_id, :destination_station_id, :route_spots, :datetime, :free_seats)
  end

  def check_profile
    if current_user.valid_profile?
      render 'new'
    else
      flash[:notice] = "Tienes que configurar tus datos para poder publicar una ruta"
      redirect_to edit_user_path(current_user)
    end
  end

end
