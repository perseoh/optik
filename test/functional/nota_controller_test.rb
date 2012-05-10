require 'test_helper'

class NotaControllerTest < ActionController::TestCase
  setup do
    @notum = nota(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nota)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notum" do
    assert_difference('Nota.count') do
      post :create, notum: @notum.attributes
    end

    assert_redirected_to notum_path(assigns(:notum))
  end

  test "should show notum" do
    get :show, id: @notum.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notum.to_param
    assert_response :success
  end

  test "should update notum" do
    put :update, id: @notum.to_param, notum: @notum.attributes
    assert_redirected_to notum_path(assigns(:notum))
  end

  test "should destroy notum" do
    assert_difference('Nota.count', -1) do
      delete :destroy, id: @notum.to_param
    end

    assert_redirected_to nota_index_path
  end
end
