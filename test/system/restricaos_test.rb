require "application_system_test_case"

class RestricaosTest < ApplicationSystemTestCase
  setup do
    @restricao = restricaos(:one)
  end

  test "visiting the index" do
    visit restricaos_url
    assert_selector "h1", text: "Restricaos"
  end

  test "creating a Restricao" do
    visit restricaos_url
    click_on "New Restricao"

    fill_in "Palavra", with: @restricao.palavra
    click_on "Create Restricao"

    assert_text "Restricao was successfully created"
    click_on "Back"
  end

  test "updating a Restricao" do
    visit restricaos_url
    click_on "Edit", match: :first

    fill_in "Palavra", with: @restricao.palavra
    click_on "Update Restricao"

    assert_text "Restricao was successfully updated"
    click_on "Back"
  end

  test "destroying a Restricao" do
    visit restricaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restricao was successfully destroyed"
  end
end
