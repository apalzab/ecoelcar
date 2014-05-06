class AddAttrsToPaths < ActiveRecord::Migration
  def change
    add_column :paths, :free_seats, :integer
  end
end
