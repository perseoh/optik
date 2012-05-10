require 'test_helper'

class MarcasControllerTest < ActionController::TestCase
  setup do
    @marca = marcas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:marcas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marca" do
    assert_difference('Marca.count') do
      post :create, marca: @marca.attributes
    end

    assert_redirected_to marca_path(assigns(:marca))
  end

  test "should show marca" do
    get :show, id: @marca.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @marca.to_param
    assert_response :success
  end

  test "should update marca" do
    put :update, id: @marca.to_param, marca: @marca.attributes
    assert_redirected_to marca_path(assigns(:marca))
  end

  test "should destroy marca" do
    assert_difference('Marca.count', -1) do
      delete :destroy, id: @marca.to_param
    end

    assert_redirected_to marcas_path
  end
end
