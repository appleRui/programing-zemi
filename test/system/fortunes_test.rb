require "application_system_test_case"

class FortunesTest < ApplicationSystemTestCase
  setup do
    @fortune = fortunes(:one)
  end

  test "visiting the index" do
    visit fortunes_url
    assert_selector "h1", text: "Fortunes"
  end

  test "creating a Fortune" do
    visit fortunes_url
    click_on "New Fortune"

    fill_in "Content", with: @fortune.content
    fill_in "Tweet", with: @fortune.tweet_id
    click_on "Create Fortune"

    assert_text "Fortune was successfully created"
    click_on "Back"
  end

  test "updating a Fortune" do
    visit fortunes_url
    click_on "Edit", match: :first

    fill_in "Content", with: @fortune.content
    fill_in "Tweet", with: @fortune.tweet_id
    click_on "Update Fortune"

    assert_text "Fortune was successfully updated"
    click_on "Back"
  end

  test "destroying a Fortune" do
    visit fortunes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fortune was successfully destroyed"
  end
end
