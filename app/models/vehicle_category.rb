# == Schema Information
#
# Table name: vehicle_categories
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class VehicleCategory < ActiveRecord::Base
  has_many :vehicles
end
