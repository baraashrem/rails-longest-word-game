require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = (0...8).map { (65 + rand(26)).chr }.join
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}.json"
    @json_hash = JSON.parse(open(url).read)
    @score = 0
    @result = @letters.chars.all? { |l| @word.count(l) <= @letters.count(l)} && @json_hash["found"] == "true"
    if @result
      @score = @word.length * 10
    end
  end
end
