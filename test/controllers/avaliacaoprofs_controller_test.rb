require 'test_helper'

class AvaliacaoprofsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliacaoprof = avaliacaoprofs(:one)
  end

  test "should get index" do
    get avaliacaoprofs_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliacaoprof_url
    assert_response :success
  end

  test "should create avaliacaoprof" do
    assert_difference('Avaliacaoprof.count') do
      post avaliacaoprofs_url, params: { avaliacaoprof: { data_avaliacao: @avaliacaoprof.data_avaliacao, dominio_conteudo: @avaliacaoprof.dominio_conteudo, possui_didatica: @avaliacaoprof.possui_didatica, professor_id: @avaliacaoprof.professor_id, recomendaria_professor: @avaliacaoprof.recomendaria_professor, relacionamento_alunos: @avaliacaoprof.relacionamento_alunos, semestre_id: @avaliacaoprof.semestre_id, user_id: @avaliacaoprof.user_id } }
    end

    assert_redirected_to avaliacaoprof_url(Avaliacaoprof.last)
  end

  test "should show avaliacaoprof" do
    get avaliacaoprof_url(@avaliacaoprof)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliacaoprof_url(@avaliacaoprof)
    assert_response :success
  end

  test "should update avaliacaoprof" do
    patch avaliacaoprof_url(@avaliacaoprof), params: { avaliacaoprof: { data_avaliacao: @avaliacaoprof.data_avaliacao, dominio_conteudo: @avaliacaoprof.dominio_conteudo, possui_didatica: @avaliacaoprof.possui_didatica, professor_id: @avaliacaoprof.professor_id, recomendaria_professor: @avaliacaoprof.recomendaria_professor, relacionamento_alunos: @avaliacaoprof.relacionamento_alunos, semestre_id: @avaliacaoprof.semestre_id, user_id: @avaliacaoprof.user_id } }
    assert_redirected_to avaliacaoprof_url(@avaliacaoprof)
  end

  test "should destroy avaliacaoprof" do
    assert_difference('Avaliacaoprof.count', -1) do
      delete avaliacaoprof_url(@avaliacaoprof)
    end

    assert_redirected_to avaliacaoprofs_url
  end
end
