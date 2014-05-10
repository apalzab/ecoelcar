require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  test "invalid without validations" do
    track = Track.new
    assert !track.valid?, "No validations in the model"
  end
end
