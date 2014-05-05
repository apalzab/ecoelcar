class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.belongs_to :user
      t.integer :origin_station_id
      t.integer :destination_station_id
      t.datetime :datetime
      t.string :route_spots
      t.timestamps
    end
  end
end
