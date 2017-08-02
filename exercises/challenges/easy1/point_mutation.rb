# calculate the hamming distance
## replace one base with another at a single nucleotide
### COUNT THE DIFFERENCE IN CHARACTERS
# strings should be of equal length 
## user the shorter string if they are not 

#Check string lengths of both strings
#If string is not of equal size
##Slice the length of the larger string
#Zip of the two strings
#Iterate through the string array and count values


class DNA
	attr_accessor :string

	def initialize(string)
		@string = string
	end

	def hamming_distance(string2)
		string1_length = string.length
		string2_length = string2.length
		if string1_length > string2_length
			new_string = @string.slice(0...string2_length)
		elsif string2_length > string1_length
			string2 = string2.slice(0...string1_length)
			new_string = @string
		end
		count = 0
		new_string.chars.zip(string2.chars).each do |s1, s2|
			count +=1 if s1 != s2
		end
		count
	end
end

require 'minitest/autorun'
require_relative 'point_mutation'

class DNATest < Minitest::Test
  def test_no_difference_between_empty_strands
    assert_equal 0, DNA.new('').hamming_distance('')
  end

  def test_no_difference_between_identical_strands
 
    assert_equal 0, DNA.new('GGACTGA').hamming_distance('GGACTGA')
  end

  def test_complete_hamming_distance_in_small_strand
 
    assert_equal 3, DNA.new('ACT').hamming_distance('GGA')
  end

  def test_hamming_distance_in_off_by_one_strand
 
    strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
    distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
    assert_equal 19, DNA.new(strand).hamming_distance(distance)
  end

  def test_small_hamming_distance_in_middle_somewhere
 
    assert_equal 1, DNA.new('GGACG').hamming_distance('GGTCG')
  end

  def test_larger_distance
 
    assert_equal 2, DNA.new('ACCAGGG').hamming_distance('ACTATGG')
  end

  def test_ignores_extra_length_on_other_strand_when_longer
 
    assert_equal 3, DNA.new('AAACTAGGGG').hamming_distance('AGGCTAGCGGTAGGAC')
  end

  def test_ignores_extra_length_on_original_strand_when_longer
 
    strand = 'GACTACGGACAGGGTAGGGAAT'
    distance = 'GACATCGCACACC'
    assert_equal 5, DNA.new(strand).hamming_distance(distance)
  end

  def test_does_not_actually_shorten_original_strand
 
    dna = DNA.new('AGACAACAGCCAGCCGCCGGATT')
    assert_equal 1, dna.hamming_distance('AGGCAA')
    assert_equal 4, dna.hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')
    assert_equal 1, dna.hamming_distance('AGG')
  end
end