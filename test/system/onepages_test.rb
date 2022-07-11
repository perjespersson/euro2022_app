require "application_system_test_case"

class OnepagesTest < ApplicationSystemTestCase
  setup do
    @onepage = onepages(:one)
  end

  test "visiting the index" do
    visit onepages_url
    assert_selector "h1", text: "Onepages"
  end

  test "should create onepage" do
    visit onepages_url
    click_on "New onepage"

    click_on "Create Onepage"

    assert_text "Onepage was successfully created"
    click_on "Back"
  end

  test "should update Onepage" do
    visit onepage_url(@onepage)
    click_on "Edit this onepage", match: :first

    click_on "Update Onepage"

    assert_text "Onepage was successfully updated"
    click_on "Back"
  end

  test "should destroy Onepage" do
    visit onepage_url(@onepage)
    click_on "Destroy this onepage", match: :first

    assert_text "Onepage was successfully destroyed"
  end
end
