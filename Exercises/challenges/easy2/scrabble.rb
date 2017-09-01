#Create a scrabble score detector 

class Scrabble
	VALUES = {"A" => 1, 'E'=>1, 'I'=>1, 'O'=>1, 'U'=>1, 'L'=>1, 'N'=>1, 'R'=>1, 'S'=>1, 'T'=>1, 'D'=>2, 'G'=>2,'B'=>3, 'C'=>3, 'M'=>3, 'P'=>3,'F'=>4, 'H'=>4, 'V'=>4, 'W'=>4, 'Y'=>4,'K'=>5,'J'=>8, 'X'=>8,'Q'=>10, 'Z'=>10}
	attr_reader :word_array, :word

	def initialize(word)
		@word = word
	end

	def score
		score = 0
		return 0 if word == nil || word == '' || word[/[^a-zA-Z]/]
		word.upcase.chars.each do |char|
			score += VALUES[char]
		end
		score
	end

	def self.score(value)
		new(value).score
	end

	private

end


# test cases
# 1. validation of the word
# 2. numbers not included in string

require 'minitest/autorun'
require_relative 'scrabble'

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end

  def test_whitespace_scores_zero
    assert_equal 0, Scrabble.new(" \t\n").score
  end

  def test_nil_scores_zero
    
    assert_equal 0, Scrabble.new(nil).score
  end

  def test_scores_very_short_word
    
    assert_equal 1, Scrabble.new('a').score
  end

  def test_scores_other_very_short_word
    
    assert_equal 4, Scrabble.new('f').score
  end

  def test_simple_word_scores_the_number_of_letters
    
    assert_equal 6, Scrabble.new('street').score
  end

  def test_complicated_word_scores_more
    
    assert_equal 22, Scrabble.new('quirky').score
  end

  def test_scores_are_case_insensitive
    
    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
  end

  def test_convenient_scoring
    
    assert_equal 13, Scrabble.score('alacrity')
  end
end