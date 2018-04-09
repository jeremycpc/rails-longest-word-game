require 'open-uri'
require 'json'
class GamesController < ApplicationController

  def new
    grid = []
    10.times { grid << ("A".."Z").to_a.sample }
    @letters = grid
    @score = session[:score]
  end

  def in_grid?(attempt_array, grid)
    attempt_array.all? { |letter| attempt_array.count(letter) <= grid.count(letter)}
  end

  def valid_word?(word, attempt_array)
    if word["found"]
      @result = "Congratulations! #{@word} is a valid English word!"
      session[:score] += attempt_array.count
    else
      @result = "Sorry '#{@word}' is not an English word"
    end
  end

  def score
    @word = params[:word].upcase
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    attempt_array = @word.split("")
    word_serialized = open(url).read
    word = JSON.parse(word_serialized)
    grid = params[:grid]
    if in_grid?(attempt_array, grid)
      valid_word?(word, attempt_array)
    else
      @result = "#{@word} is not in the grid!"
    end
  end

  def reset
    session[:score] = 0
    redirect_to new_path              # redirect to "new view" with session score reset
  end


end
