=begin
PROCESS
given: a string of digits, an integer of a given length
return: a list of all the possible combinations of consecutive digits of the given length

Instantiate a `Series` object and initialize it with the given digits

Create an instance method `#series` that takes one argument: an integer that sets the length of consecutive numbers
to list

given "1234"

series(1) should return [[1], [2], [3], [4]] as an array of arrays containing integers

if the arguments supplied to #series is larger than the given string throw an ArgumentError

given "1234"

series(2) should return [[1, 2], [2, 3], [3, 4]]

ALGO

"1234"
1 consecectuive

when it's at 4 the index is 3. 3 + 1 = 4

"1234"
2 consecutive

when it's at 3 the index is 2. 2 + 2 = 4

Given a string of digits and a consecutive number length

initialize an array to hold the list

iterate through each digit of the string until
  the consecutive number length + the current index equals the length of the digits
  each iteration takes a slice from the current index to the consecutive number length
  convert that slice into an array of integers and add it to the list
  
return the list of strings


  use #each_cons?
  
=end
  
class Series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
  end

  def slices(slice)
    raise ArgumentError if slice > @digits.length
    # @digits.each_cons(slice).to_a
    consecutive(slice)
  end

  private 

  def consecutive(length)
    counter = 0
    list = []

    until counter + length > @digits.length
      list << @digits[counter..(counter + length - 1)]
      counter += 1
    end

    list
  end

end

