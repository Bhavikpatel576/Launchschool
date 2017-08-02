class Phrase
  def initialize(words)
    @words = words
  end

  def word_count
    count = Hash.new(0)

    @words.scan(/\b[\w']+\b/) do |word|
      count[word.downcase] += 1
    end

    count
  end
end

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words_in_phrase.each_with_object(Hash.new(0)) do |word, results|
      results[word] += 1
    end
  end

  private

  def words_in_phrase
    @phrase.downcase.scan(/\w+'?\w+|\w+/)
  end
end

class Phrase
  def initialize(phrase)
    @words = phrase.downcase.scan(/[a-z]+'?[a-z]+|\d+/)
  end

  def word_count
    @words.each_with_object(Hash.new(0)) do |word, results|
      results[word] += 1
    end
  end
end