class AddDistanceToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :distance, :float
  end
end
