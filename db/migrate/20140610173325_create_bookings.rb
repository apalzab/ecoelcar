class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.float :price
      t.references :user
      t.references :track

      t.timestamps
    end
  end
end
