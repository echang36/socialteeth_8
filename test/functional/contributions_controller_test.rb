require 'test_helper'

class ContributionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Contribution.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Contribution.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Contribution.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to contribution_url(assigns(:contribution))
  end

  def test_edit
    get :edit, :id => Contribution.first
    assert_template 'edit'
  end

  def test_update_invalid
    Contribution.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Contribution.first
    assert_template 'edit'
  end

  def test_update_valid
    Contribution.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Contribution.first
    assert_redirected_to contribution_url(assigns(:contribution))
  end

  def test_destroy
    contribution = Contribution.first
    delete :destroy, :id => contribution
    assert_redirected_to contributions_url
    assert !Contribution.exists?(contribution.id)
  end
end
