class TracksController < ApplicationController
  require 'will_paginate/array'

  def index
    @tracks = Track.active.recents.paginate(:page => params[:page], :per_page => 6)
    # @tracks = Track.all
  end

  def create
    current_user.tracks.create(track_params)
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

end
