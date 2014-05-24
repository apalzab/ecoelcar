# == Schema Information
#
# Table name: vehicles
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  created_at           :datetime
#  updated_at           :datetime
#  model                :string(255)
#  horse_power          :string(255)
#  year_of_registration :integer
#  seats                :integer
#  brand                :string(255)
#  photo_file_name      :string(255)
#  photo_content_type   :string(255)
#  photo_file_size      :integer
#  photo_updated_at     :datetime
#

class Vehicle < ActiveRecord::Base
  belongs_to :user

  has_attached_file :photo, :default_url => ActionController::Base.helpers.asset_path('missing.png')
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/, message: ''

  validates :brand, :model, :seats, presence: true
  validates :seats, inclusion: { in: 1..5 }

end
