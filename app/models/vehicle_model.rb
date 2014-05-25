# == Schema Information
#
# Table name: vehicle_models
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class VehicleModel < ActiveRecord::Base
  belongs_to :vehicle_brand
end
