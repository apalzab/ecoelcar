class AddVehicleBrandIdToVehicleModels < ActiveRecord::Migration
  def change
    add_column :vehicle_models, :vehicle_brand_id, :integer
  end
end
