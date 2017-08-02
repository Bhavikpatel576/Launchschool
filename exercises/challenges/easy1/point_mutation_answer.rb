class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand_2)
    strand_1 = @strand[0, strand_2.length]

    strand_1.chars.zip(strand_2.chars).count { |pair| pair.first != pair.last }
  end
end

class DNA
  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    distance = 0
    min, max = [@strand1, strand2].sort_by(&:size)
    min.each_char.with_index do |char, index|
      distance += 1 unless char == max[index]
    end
    distance
  end
end

class DNA # :nodoc:
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    length = [@strand.size, other.size].min - 1

    (0..length).reduce(0) do |distance, idx|
      @strand[idx] == other[idx] ? distance : distance + 1
    end
  end
end