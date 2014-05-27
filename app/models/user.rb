# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  name                   :string(255)
#  last_name              :string(255)
#  drive_license_old      :integer
#  ocupation              :string(255)
#  hobbies                :string(255)
#  description            :text
#  photo_file_name        :string(255)
#  photo_content_type     :string(255)
#  photo_file_size        :integer
#  photo_updated_at       :datetime
#  age                    :integer
#

class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  before_create :set_attrs
  after_create :initialize_attrs

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :photo, :default_url => ActionController::Base.helpers.asset_path('missing.png')

  has_many :vehicles
  has_many :tracks
  accepts_nested_attributes_for :vehicles

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def set_attrs
    self.username = self.email.split("@").first.parameterize
  end

  def initialize_attrs
    self.vehicles.create
  end

  def valid_profile?
    self.vehicles.each do |v|
      if v.brand.nil? or v.model.nil? or v.seats.nil?
        break false
      else
        return true
      end
    end
  end
end
