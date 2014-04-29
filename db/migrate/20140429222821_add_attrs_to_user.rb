class AddAttrsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :drive_license_old, :integer
    add_column :users, :profesion, :string
    add_column :users, :hobbies, :string
    add_column :users, :description, :text
  end
end
