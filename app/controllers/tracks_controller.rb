class TracksController < ApplicationController

  def index
    @tracks = Track.all
  end

  def create

    track_params
    date = Time.parse(track_params[:datetime])
    time = track_params['datetime(4i)']
    time << ":"
    time << track_params['datetime(5i)']
    time = Time.parse(time)
    datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.strftime('%M').to_i)

    somedate = DateTime.new(track_params["datetime(1i)"].to_i, 
                        track_params["datetime(2i)"].to_i,
                        track_params["datetime(3i)"].to_i,
                        track_params["datetime(4i)"].to_i,
                        track_params["datetime(5i)"].to_i)


    current_user.tracks.create(track_params)
    raise 'ok'
    render 'show'
  end

  private
  def track_params
    params.require(:track).permit({:origin_station_id => []}, {:destination_station_id => []}, :route_spots, :datetime)
  end

end



# params[:track]['datetime(4i)']