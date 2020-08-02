require 'test_helper'

class Codable::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Codable
  end
end
