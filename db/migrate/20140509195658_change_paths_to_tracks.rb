class ChangePathsToTracks < ActiveRecord::Migration
  def change
    rename_table :paths, :tracks
  end
end
