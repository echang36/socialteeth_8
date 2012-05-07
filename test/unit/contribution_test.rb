require 'test_helper'

class ContributionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Contribution.new.valid?
  end
end
