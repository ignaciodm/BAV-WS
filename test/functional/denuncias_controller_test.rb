require 'test_helper'

class DenunciasControllerTest < ActionController::TestCase
  setup do
    @denuncium = denuncia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:denuncias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create denuncium" do
    assert_difference('Denuncium.count') do
      post :create, denuncium: { comisaria_id: @denuncium.comisaria_id, direccion_id: @denuncium.direccion_id, estado: @denuncium.estado, observacion: @denuncium.observacion, usuario_id: @denuncium.usuario_id }
    end

    assert_redirected_to denuncium_path(assigns(:denuncium))
  end

  test "should show denuncium" do
    get :show, id: @denuncium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @denuncium
    assert_response :success
  end

  test "should update denuncium" do
    put :update, id: @denuncium, denuncium: { comisaria_id: @denuncium.comisaria_id, direccion_id: @denuncium.direccion_id, estado: @denuncium.estado, observacion: @denuncium.observacion, usuario_id: @denuncium.usuario_id }
    assert_redirected_to denuncium_path(assigns(:denuncium))
  end

  test "should destroy denuncium" do
    assert_difference('Denuncium.count', -1) do
      delete :destroy, id: @denuncium
    end

    assert_redirected_to denuncia_path
  end
end
