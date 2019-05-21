require "application_system_test_case"

class AvaliacaoprofsTest < ApplicationSystemTestCase
  setup do
    @avaliacaoprof = avaliacaoprofs(:one)
  end

  test "visiting the index" do
    visit avaliacaoprofs_url
    assert_selector "h1", text: "Avaliacaoprofs"
  end

  test "creating a Avaliacaoprof" do
    visit avaliacaoprofs_url
    click_on "New Avaliacaoprof"

    fill_in "Data avaliacao", with: @avaliacaoprof.data_avaliacao
    check "Dominio conteudo" if @avaliacaoprof.dominio_conteudo
    check "Possui didatica" if @avaliacaoprof.possui_didatica
    fill_in "Professor", with: @avaliacaoprof.professor_id
    fill_in "Recomendaria professor", with: @avaliacaoprof.recomendaria_professor
    check "Relacionamento alunos" if @avaliacaoprof.relacionamento_alunos
    fill_in "Semestre", with: @avaliacaoprof.semestre_id
    fill_in "User", with: @avaliacaoprof.user_id
    click_on "Create Avaliacaoprof"

    assert_text "Avaliacaoprof was successfully created"
    click_on "Back"
  end

  test "updating a Avaliacaoprof" do
    visit avaliacaoprofs_url
    click_on "Edit", match: :first

    fill_in "Data avaliacao", with: @avaliacaoprof.data_avaliacao
    check "Dominio conteudo" if @avaliacaoprof.dominio_conteudo
    check "Possui didatica" if @avaliacaoprof.possui_didatica
    fill_in "Professor", with: @avaliacaoprof.professor_id
    fill_in "Recomendaria professor", with: @avaliacaoprof.recomendaria_professor
    check "Relacionamento alunos" if @avaliacaoprof.relacionamento_alunos
    fill_in "Semestre", with: @avaliacaoprof.semestre_id
    fill_in "User", with: @avaliacaoprof.user_id
    click_on "Update Avaliacaoprof"

    assert_text "Avaliacaoprof was successfully updated"
    click_on "Back"
  end

  test "destroying a Avaliacaoprof" do
    visit avaliacaoprofs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Avaliacaoprof was successfully destroyed"
  end
end
