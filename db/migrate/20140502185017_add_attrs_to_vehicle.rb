class AddAttrsToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :model, :string
    add_column :vehicles, :horse_power, :string
    add_column :vehicles, :year_of_registration, :integer
    add_column :vehicles, :seats, :integer
    add_column :vehicles, :brand, :string
    add_attachment :vehicles, :photo
  end

end
