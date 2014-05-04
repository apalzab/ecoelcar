class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.belongs_to :user
      t.timestamps
    end
  end
end
