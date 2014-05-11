class TracksController < ApplicationController

  def index
    @tracks = Track.all
  end

  def create
    current_user.tracks.create(track_params)
    render 'show'
  end

  private
  def track_params
    params.require(:track).permit(:origin_station_id, :destination_station_id, :route_spots, :datetime)
  end

end
