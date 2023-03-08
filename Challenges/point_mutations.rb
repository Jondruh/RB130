=begin
PROCESS
  given two DNA strands, calculate the hamming distance between them.

  The hamming distance is the minimum number of mutations (differences) that had to occur
  to go from one DNA strand to the other.

  so count the number of difference between the DNA strands (by character)

  if one DNA strand has more characters than the other, compare the number of characters of the
    shorter DNA strand.

EXAMPLES
    GAGCCTACTAACGGGAT
    CATCGTAATGACGGCCT
    ^ ^ ^  ^ ^    ^^

    hamming disntance = 7

    GAGCCTACTAACG
    CATCGTAATGACGGCCT
    ^ ^ ^  ^ ^

    hamming distance = 5

DATA
    Strings that represent DNA
    Arrays that we will compare
    integers to count
ALGORITHM
    given two arrays of letters
    create a hamm_counter variable set to 0
    iterate over the shorter array
    compare the value of the shorter array against the corresponding value
    of the other array
    if the values are equal
      go to next iteration
    if the values are unequal
      increment the hamm_counter by 1

    return the hamm_counter
=end

class DNA
  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(other_dna)
    hamm_distance = 0
        
    smaller_dna, larger_dna = [@dna, other_dna].sort_by(&:size) 

    smaller_dna.each_char.with_index do |ele, ind|
      hamm_distance += 1 unless ele == larger_dna[ind]
    end

    hamm_distance
  end
end