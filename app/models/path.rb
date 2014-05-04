# == Schema Information
#
# Table name: paths
#
#  id                       :integer          not null, primary key
#  user_id                  :integer
#  origin_station_id        :integer
#  destination_station_id   :integer
#  date                     :date
#  latitudes_and_longitudes :text
#  created_at               :datetime
#  updated_at               :datetime
#

class Path < ActiveRecord::Base
end
