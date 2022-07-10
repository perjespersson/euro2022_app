require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "should create game" do
    visit games_url
    click_on "New game"

    fill_in "Away team", with: @game.away_team_id
    fill_in "Away team score", with: @game.away_team_score
    fill_in "Home team", with: @game.home_team_id
    fill_in "Home team score", with: @game.home_team_score
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "should update Game" do
    visit game_url(@game)
    click_on "Edit this game", match: :first

    fill_in "Away team", with: @game.away_team_id
    fill_in "Away team score", with: @game.away_team_score
    fill_in "Home team", with: @game.home_team_id
    fill_in "Home team score", with: @game.home_team_score
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "should destroy Game" do
    visit game_url(@game)
    click_on "Destroy this game", match: :first

    assert_text "Game was successfully destroyed"
  end
end
