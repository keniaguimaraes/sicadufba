require 'test_helper'

class RestricaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restricao = restricaos(:one)
  end

  test "should get index" do
    get restricaos_url
    assert_response :success
  end

  test "should get new" do
    get new_restricao_url
    assert_response :success
  end

  test "should create restricao" do
    assert_difference('Restricao.count') do
      post restricaos_url, params: { restricao: { palavra: @restricao.palavra } }
    end

    assert_redirected_to restricao_url(Restricao.last)
  end

  test "should show restricao" do
    get restricao_url(@restricao)
    assert_response :success
  end

  test "should get edit" do
    get edit_restricao_url(@restricao)
    assert_response :success
  end

  test "should update restricao" do
    patch restricao_url(@restricao), params: { restricao: { palavra: @restricao.palavra } }
    assert_redirected_to restricao_url(@restricao)
  end

  test "should destroy restricao" do
    assert_difference('Restricao.count', -1) do
      delete restricao_url(@restricao)
    end

    assert_redirected_to restricaos_url
  end
end
