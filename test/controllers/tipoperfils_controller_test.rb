require 'test_helper'

class TipoperfilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipoperfil = tipoperfils(:one)
  end

  test "should get index" do
    get tipoperfils_url
    assert_response :success
  end

  test "should get new" do
    get new_tipoperfil_url
    assert_response :success
  end

  test "should create tipoperfil" do
    assert_difference('Tipoperfil.count') do
      post tipoperfils_url, params: { tipoperfil: { perfil: @tipoperfil.perfil } }
    end

    assert_redirected_to tipoperfil_url(Tipoperfil.last)
  end

  test "should show tipoperfil" do
    get tipoperfil_url(@tipoperfil)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipoperfil_url(@tipoperfil)
    assert_response :success
  end

  test "should update tipoperfil" do
    patch tipoperfil_url(@tipoperfil), params: { tipoperfil: { perfil: @tipoperfil.perfil } }
    assert_redirected_to tipoperfil_url(@tipoperfil)
  end

  test "should destroy tipoperfil" do
    assert_difference('Tipoperfil.count', -1) do
      delete tipoperfil_url(@tipoperfil)
    end

    assert_redirected_to tipoperfils_url
  end
end
