=begin
PROCESS
given a string
return an integer representing the scrabble score for the given string

score is case insensitive

Each letter should be scored seperately and then added to the total

given no letters or nil return 0

ALGORITHM
given a string
initialize total score to 0

if string is nil/empty return 0

uppercase all the letters
check each letter and return the score for the letter
  -tally?
  -map?
add all the scores together
return the total score

=end

class Scrabble
  SCORE = { 1 => %w(A E I O U L N R S T),
          2 => %w(D G),
          3 => %w(B C M P),
          4 => %w(F H V W Y),
          5 => ["K"],
          8 => %w(J X),
          10 => %w(Q Z)
        }

  def initialize(word)
    @word = word ? word : ''
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    return 0 unless @word.match?(/[a-z]/i)

    @word.upcase.chars.map do |letter|
      SCORE.each { |key, value| break key if value.include?(letter) }
    end.sum
  end
end

