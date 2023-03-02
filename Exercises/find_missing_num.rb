=begin
given a sorted array of integers
return a sorted array of integers
  all of the integers between the first and the last integers of the given array
    that aren't included already in the given array

Take the first and the last integers of the given array.
Create a range of those two integers
subtract any duplicates from that range
and return the range with the duplicates removed as an array

=end

def missing(arr)
  range = (arr.first..arr.last)
  range.to_a - arr
end 

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []