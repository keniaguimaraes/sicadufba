require 'test_helper'

class ComentarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comentar = comentars(:one)
  end

  test "should get index" do
    get comentars_url
    assert_response :success
  end

  test "should get new" do
    get new_comentar_url
    assert_response :success
  end

  test "should create comentar" do
    assert_difference('Comentar.count') do
      post comentars_url, params: { comentar: { disciplinacurso_id: @comentar.disciplinacurso_id, professor_id: @comentar.professor_id, semestre_id: @comentar.semestre_id, user_id: @comentar.user_id } }
    end

    assert_redirected_to comentar_url(Comentar.last)
  end

  test "should show comentar" do
    get comentar_url(@comentar)
    assert_response :success
  end

  test "should get edit" do
    get edit_comentar_url(@comentar)
    assert_response :success
  end

  test "should update comentar" do
    patch comentar_url(@comentar), params: { comentar: { disciplinacurso_id: @comentar.disciplinacurso_id, professor_id: @comentar.professor_id, semestre_id: @comentar.semestre_id, user_id: @comentar.user_id } }
    assert_redirected_to comentar_url(@comentar)
  end

  test "should destroy comentar" do
    assert_difference('Comentar.count', -1) do
      delete comentar_url(@comentar)
    end

    assert_redirected_to comentars_url
  end
end
