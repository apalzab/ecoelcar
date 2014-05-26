# == Schema Information
#
# Table name: vehicle_brands
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class VehicleBrand < ActiveRecord::Base
  has_many :vehicles
  has_many :models, class_name: "VehicleModel"
end
