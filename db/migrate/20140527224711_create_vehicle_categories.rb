class CreateVehicleCategories < ActiveRecord::Migration
  def change
    create_table :vehicle_categories do |t|
      t.string :name
    end

    add_column :vehicles, :vehicle_category_id, :integer
  end
end
