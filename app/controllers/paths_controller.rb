class PathsController < ApplicationController

  def index
    @paths = Path.all
  end

  def create
    path_params
    current_user.paths.create(origin_station_id: params[:path][:origin_station_id],
      destination_station_id: params[:path][:destination_station_id])
    raise 'ok'
  end

  private
  def path_params
    params.require(:path).permit(:origin_station_id, :destination_station_id, :route_spots, :datetime)
  end

end
