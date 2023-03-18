# given a capital letter between A-Z

# Return a string representation of a diamond where the walls of the diamond
# are the Alphabet letters up to the given capital letter

# Starts with 'A'.
# Goes up to the size of the given letter then back to A

# so given 'C'
# return:
#    A
#   B B
#  C   C
#   B B
#    A

# ALGO
# given a letter
# return 'A' if the letter is A

# create an array to hold the lines of the diamond
# Place a single `A` as the first element in the array

# create an inner_pad = 1

# from B to that letter
#   Each letter do the following
#   create a string that is
#     the current letter + counter * " " + the current letter
#   increment the inner_pad by 2

# pad each string with spaces the length of (A through letter times 2) - 1
# add on to the end of the array
#   the array excepting the last index reversed
# join the array with new lines

# return the joined string

class Diamond
  def self.make_diamond(given_letter)
    return "#{given_letter}\n" if given_letter == 'A'

    width = (('A'..given_letter).to_a.size * 2) - 1
    space_between = 1

    diamond = ['A'.center(width)]

    ('B'..given_letter).each do |letter|
      diamond << (letter + (' ' * space_between) + letter).center(width)
      space_between += 2
    end

    "#{(diamond << diamond[0..-2].reverse).join("\n")}\n"
  end
end
