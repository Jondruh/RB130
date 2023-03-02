# given a positive integer
# return a list of all teh divisors of the given integer
#
# take the given number
# create an array with 1 in it.
# from 2 upto the given number 
#   check if the modulo is 0
#     if it is 0 then place the current number in the array
#     move on the next numbers
#
# 

def divisors(num)
  1.upto(num).select do |count|
    num % count == 0
  end
end

class Integer
  def factors
    1.upto(Integer.sqrt(self)).select { |i| (self % i).zero? }.reduce([]) do |f, i|
      f << self/i unless i == self/i
      f << i
    end.sort
  end
end

puts 1.factors == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts 99400891.factors == [1, 9967, 9973, 99400891] # may take a minute
p 999962000357.factors