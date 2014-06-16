class AddPriceToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :price, :float
  end
end
