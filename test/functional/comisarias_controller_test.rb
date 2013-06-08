require 'test_helper'

class ComisariasControllerTest < ActionController::TestCase
  setup do
    @comisaria = comisarias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comisarias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comisaria" do
    assert_difference('Comisaria.count') do
      post :create, comisaria: { calle: @comisaria.calle, nombre: @comisaria.nombre, numero: @comisaria.numero, telefono: @comisaria.telefono }
    end

    assert_redirected_to comisaria_path(assigns(:comisaria))
  end

  test "should show comisaria" do
    get :show, id: @comisaria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comisaria
    assert_response :success
  end

  test "should update comisaria" do
    put :update, id: @comisaria, comisaria: { calle: @comisaria.calle, nombre: @comisaria.nombre, numero: @comisaria.numero, telefono: @comisaria.telefono }
    assert_redirected_to comisaria_path(assigns(:comisaria))
  end

  test "should destroy comisaria" do
    assert_difference('Comisaria.count', -1) do
      delete :destroy, id: @comisaria
    end

    assert_redirected_to comisarias_path
  end
end
