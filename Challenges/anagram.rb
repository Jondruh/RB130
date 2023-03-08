=begin
PROCESS
given a word and a list of words
return a new list of words that are all those words from the list of words that are anagrams
of the given word.

if there are no anagram matches return an empty array
if there are more than one matches return multiple items

test is case insensitive
the same word as the given word is not an anagram, has to be different

ALGO
given a word
given a list

initialize an anagram list

iterate over each list item
lowercase the list item
sort the list item
compare the list item to the given word
if they are the same (and they aren't the same before the sort) add the list item to the anagram list



=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    word_letters = @word.downcase.chars.sort
    list.select do |ele|
      ele.downcase.chars.sort == word_letters && ele.downcase != @word.downcase
    end
  end
end

    
