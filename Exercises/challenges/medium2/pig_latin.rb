# consonant_split = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)

# 1. if word begins with vowel - add 'ay' to the end
# 2. consonate - move first letter to the back and add ay
# 3. handle specfic edge cases
			# a. ch, qu, th, thr, sch - move to the back and add ay
			# b. consonate + qu - move group to the back and add ay
			# c. y
			# 	- ye: move y to the back
			# 	- yt: don't change
			# d. x
			# 	- xe: move x to the back
			# 	- xr: don't change

class PigLatin
	attr_reader :word
	def initialize(word)
		@word = word.downcase;
	end

  def vowel_sound(word)
    word +'ay'
  end

  def consonate_sound(word)
    consonant_split = /\A([^aeio]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
    puts consonant_split
    [consonant_split[1], consonant_split[2]]
  end

	#handle actual translation
	def translate_word
    if word.match(/\A[aeio]|[xy]+[^aeiou]/)
      vowel_sound(word)
    else
      consonant_sound, the_rest_of_word = consonate_sound(word)
      the_rest_of_word + consonant_sound + 'ay'
    end
	end

	#handle phrases
	def self.translate(phrase)
      phrase.split(" ").map do |word|
        PigLatin.new(word).translate_word
      end.join(" ")
	end
end

require 'minitest/autorun'
require_relative 'pig_latin'

class PigLatinTest < Minitest::Test
  def test_word_beginning_with_a
    assert_equal 'appleay', PigLatin.translate('apple')
  end

  def test_other_word_beginning_e
    # skip
    assert_equal 'earay', PigLatin.translate('ear')
  end

  def test_word_beginning_with_p
    # skip
    assert_equal 'igpay', PigLatin.translate('pig')
  end

  def test_word_beginning_with_k
    # skip
    assert_equal 'oalakay', PigLatin.translate('koala')
  end

  def test_word_beginning_with_ch
    # skip
    assert_equal 'airchay', PigLatin.translate('chair')
  end

  def test_word_beginning_with_qu
    # skip
    assert_equal 'eenquay', PigLatin.translate('queen')
  end

  def test_word_with_consonant_preceding_qu
    # skip
    assert_equal 'aresquay', PigLatin.translate('square')
  end

  def test_word_beginning_with_th
    # skip
    assert_equal 'erapythay', PigLatin.translate('therapy')
  end

  def test_word_beginning_with_thr
    # skip
    assert_equal 'ushthray', PigLatin.translate('thrush')
  end

  def test_word_beginning_with_sch
    # skip
    assert_equal 'oolschay', PigLatin.translate('school')
  end

  def test_translates_phrase
    # skip
    assert_equal 'ickquay astfay unray', PigLatin.translate('quick fast run')
  end

  def test_word_beginning_with_ye
    # skip
    assert_equal 'ellowyay', PigLatin.translate('yellow')
  end

  def test_word_beginning_with_yt
    # skip
    assert_equal 'yttriaay', PigLatin.translate('yttria')
  end

  def test_word_beginning_with_xe
    # skip
    assert_equal 'enonxay', PigLatin.translate('xenon')
  end

  def test_word_beginning_with_xr
    # skip
    assert_equal 'xrayay', PigLatin.translate('xray')
  end
end
