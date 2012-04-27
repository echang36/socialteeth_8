require 'test_helper'

class HomesControllerTest < ActionController::TestCase
  def test_show
    get :show, :id => Home.first
    assert_template 'show'
  end
end
