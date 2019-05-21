require "application_system_test_case"

class ComentariotagsTest < ApplicationSystemTestCase
  setup do
    @comentariotag = comentariotags(:one)
  end

  test "visiting the index" do
    visit comentariotags_url
    assert_selector "h1", text: "Comentariotags"
  end

  test "creating a Comentariotag" do
    visit comentariotags_url
    click_on "New Comentariotag"

    fill_in "Comentar", with: @comentariotag.comentar_id
    fill_in "Tag", with: @comentariotag.tag_id
    click_on "Create Comentariotag"

    assert_text "Comentariotag was successfully created"
    click_on "Back"
  end

  test "updating a Comentariotag" do
    visit comentariotags_url
    click_on "Edit", match: :first

    fill_in "Comentar", with: @comentariotag.comentar_id
    fill_in "Tag", with: @comentariotag.tag_id
    click_on "Update Comentariotag"

    assert_text "Comentariotag was successfully updated"
    click_on "Back"
  end

  test "destroying a Comentariotag" do
    visit comentariotags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comentariotag was successfully destroyed"
  end
end
