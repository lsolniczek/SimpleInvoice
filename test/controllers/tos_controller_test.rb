require 'test_helper'

class TosControllerTest < ActionController::TestCase
  setup do
    @to = tos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create to" do
    assert_difference('To.count') do
      post :create, to: { email: @to.email, invoice_id: @to.invoice_id, moreInfo: @to.moreInfo, name: @to.name }
    end

    assert_redirected_to to_path(assigns(:to))
  end

  test "should show to" do
    get :show, id: @to
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @to
    assert_response :success
  end

  test "should update to" do
    patch :update, id: @to, to: { email: @to.email, invoice_id: @to.invoice_id, moreInfo: @to.moreInfo, name: @to.name }
    assert_redirected_to to_path(assigns(:to))
  end

  test "should destroy to" do
    assert_difference('To.count', -1) do
      delete :destroy, id: @to
    end

    assert_redirected_to tos_path
  end
end
