class AddVehicleBrandToVehicles < ActiveRecord::Migration
  def change
    remove_column :vehicles, :brand
    add_column :vehicles, :vehicle_brand_id, :integer
  end
end
