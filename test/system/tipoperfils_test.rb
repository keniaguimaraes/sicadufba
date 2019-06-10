require "application_system_test_case"

class TipoperfilsTest < ApplicationSystemTestCase
  setup do
    @tipoperfil = tipoperfils(:one)
  end

  test "visiting the index" do
    visit tipoperfils_url
    assert_selector "h1", text: "Tipoperfils"
  end

  test "creating a Tipoperfil" do
    visit tipoperfils_url
    click_on "New Tipoperfil"

    fill_in "Perfil", with: @tipoperfil.perfil
    click_on "Create Tipoperfil"

    assert_text "Tipoperfil was successfully created"
    click_on "Back"
  end

  test "updating a Tipoperfil" do
    visit tipoperfils_url
    click_on "Edit", match: :first

    fill_in "Perfil", with: @tipoperfil.perfil
    click_on "Update Tipoperfil"

    assert_text "Tipoperfil was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipoperfil" do
    visit tipoperfils_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipoperfil was successfully destroyed"
  end
end
