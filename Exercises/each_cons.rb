#yield each consecectuive element
#initialize an index variable to 0
#yield that index element and the next index element to the block
#increment the index varaible
#do this until the second index is no longer less than the size of the array

require 'pry'

def each_cons(array, num_consecutive)
  index = 0 
  while index + num_consecutive <= array.size
    yield(*array[index..-1].first(num_consecutive))
    index += 1
  end

  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
puts hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
puts hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
puts hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
puts hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
puts hash == {}