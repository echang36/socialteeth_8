require 'test_helper'

class AdTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Ad.new.valid?
  end
end
