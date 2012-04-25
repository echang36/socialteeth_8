require 'test_helper'
require "test/unit"

class AdTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Ad.new.valid?
  end
end

class AdTest < Test::Unit::TestCase
	def test_true_is_true
		assert true, "True should be truthy"
	end
end