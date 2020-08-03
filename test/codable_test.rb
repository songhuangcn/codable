require 'test_helper'

module Codable
  class Test < ActiveSupport::TestCase
    test 'find by code' do
      assert_equal platforms(:linux), Platform[:linux]
    end

    test 'judging by method when right' do
      assert Platform[:linux].linux?
    end

    test 'judging by method when wrong' do
      assert_not Platform[:linux].macos?
    end

    test 'use with another attribute' do
      assert_equal editors(:vim), Editor[:vim]
    end
  end
end
