class PathsController < ApplicationController

  def index
    @paths = Path.all
  end

  def create
    path_params
    date = Time.parse(params[:path][:datetime])
    time = params[:path]['datetime(4i)']
    time << ":"
    time << params[:path]['datetime(5i)']
    time = Time.parse(time)
    datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.strftime('%M').to_i)
    current_user.paths.create(origin_station_id: params[:path][:origin_station_id][1],
      destination_station_id: params[:path][:destination_station_id][1], datetime: datetime, route_spots: params[:path][:route_spots])
    render 'show'
  end

  private
  def path_params
    params.require(:path).permit(:origin_station_id, :destination_station_id, :route_spots, :datetime)
  end

end



# params[:path]['datetime(4i)']