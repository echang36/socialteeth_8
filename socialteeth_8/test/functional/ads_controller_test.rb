require 'test_helper'

class AdsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Ad.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Ad.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Ad.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ad_url(assigns(:ad))
  end

  def test_edit
    get :edit, :id => Ad.first
    assert_template 'edit'
  end

  def test_update_invalid
    Ad.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Ad.first
    assert_template 'edit'
  end

  def test_update_valid
    Ad.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Ad.first
    assert_redirected_to ad_url(assigns(:ad))
  end

  def test_destroy
    ad = Ad.first
    delete :destroy, :id => ad
    assert_redirected_to ads_url
    assert !Ad.exists?(ad.id)
  end
end
