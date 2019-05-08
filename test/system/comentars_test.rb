require "application_system_test_case"

class ComentarsTest < ApplicationSystemTestCase
  setup do
    @comentar = comentars(:one)
  end

  test "visiting the index" do
    visit comentars_url
    assert_selector "h1", text: "Comentars"
  end

  test "creating a Comentar" do
    visit comentars_url
    click_on "New Comentar"

    fill_in "Disciplinacurso", with: @comentar.disciplinacurso_id
    fill_in "Professor", with: @comentar.professor_id
    fill_in "Semestre", with: @comentar.semestre_id
    fill_in "User", with: @comentar.user_id
    click_on "Create Comentar"

    assert_text "Comentar was successfully created"
    click_on "Back"
  end

  test "updating a Comentar" do
    visit comentars_url
    click_on "Edit", match: :first

    fill_in "Disciplinacurso", with: @comentar.disciplinacurso_id
    fill_in "Professor", with: @comentar.professor_id
    fill_in "Semestre", with: @comentar.semestre_id
    fill_in "User", with: @comentar.user_id
    click_on "Update Comentar"

    assert_text "Comentar was successfully updated"
    click_on "Back"
  end

  test "destroying a Comentar" do
    visit comentars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comentar was successfully destroyed"
  end
end
