require 'test_helper'

class FromsControllerTest < ActionController::TestCase
  setup do
    @from = froms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:froms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create from" do
    assert_difference('From.count') do
      post :create, from: { email: @from.email, invoice_id: @from.invoice_id, moreInfo: @from.moreInfo, name: @from.name }
    end

    assert_redirected_to from_path(assigns(:from))
  end

  test "should show from" do
    get :show, id: @from
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @from
    assert_response :success
  end

  test "should update from" do
    patch :update, id: @from, from: { email: @from.email, invoice_id: @from.invoice_id, moreInfo: @from.moreInfo, name: @from.name }
    assert_redirected_to from_path(assigns(:from))
  end

  test "should destroy from" do
    assert_difference('From.count', -1) do
      delete :destroy, id: @from
    end

    assert_redirected_to froms_path
  end
end
