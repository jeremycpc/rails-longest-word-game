require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  # test "Filling the form with a random word gives us a message that the word is not in the grid"
  #   visit new_url
  #   fill_in "word", with:
  # end
end
