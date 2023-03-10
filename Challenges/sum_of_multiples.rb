=begin
PROCESS
given a number and a set of numbers
return the sum of
  all the multiples of the set of numbers up to the given number (not including the given number)  
  
if no set is given default to 3 and 5.
numbers that are multiples of more than one member of the given set are only included once

if given number is 20 and no set is given
  the multiples will be 3, 5, 6, 9, 10, 12, 15, and 18
  the sum of the multiplies will be 78

ALGORITHM
given a number and set_of_numbers

for each number from 1 up to 1 less than the given_number
  check the current number against all the given set of numbers
  if the current number can be divided evenly by the set number
  add it to the count and go to the next number in the for each loop
=end
class SumOfMultiples
  def initialize(*set)
    @set = set
  end

  def self.to(num, set = [3, 5])
    sum = 0

    1.upto(num - 1) do |counter|
      if set.any? { |set_num| counter % set_num == 0 }
        sum += counter
      end
    end
    
    sum
  end

  def to(num)
    self.class.to(num, @set)
  end
end
