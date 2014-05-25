class AddVehicleModelIdToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :vehicle_model_id, :integer
  end
end
