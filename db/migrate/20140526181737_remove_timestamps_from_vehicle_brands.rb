class RemoveTimestampsFromVehicleBrands < ActiveRecord::Migration
  def change
    remove_column :vehicle_brands, :created_at, :string
    remove_column :vehicle_brands, :updated_at, :string
  end
end
