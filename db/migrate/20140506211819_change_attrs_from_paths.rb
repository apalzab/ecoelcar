class ChangeAttrsFromPaths < ActiveRecord::Migration
  def change
    change_column :paths, :route_spots, :text
  end
end
