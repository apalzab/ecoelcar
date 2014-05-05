# == Schema Information
#
# Table name: stations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  latlng      :string(255)
#  description :string(255)
#

class Station < ActiveRecord::Base

  validates_uniqueness_of :name
end
