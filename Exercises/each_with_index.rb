# given an array
# return the given array
# iterate through the array yielding the ele and the elements index to a block

# keep track of the index
# iterate over the array

def each_with_index(arr)
  ind = 0

  while ind < arr.size
    yield(arr[ind], ind)
    ind += 1 
  end

  arr
end


result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true