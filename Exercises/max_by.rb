#given an array
#return the element for which the return value is greatest from yielding the element to the block

#iterate through each element of the array
#pass each element to the block
#compare the return value of the block to the max return value
# if the return value is greater than the current value OR its the first block
#   make the greater value then new max value
#   save that element as the greatest element 

def max_by(arr)
  max_object = nil 
  max = nil

  arr.each_with_index do |ele, index|
    value = yield(ele)
    if index == 0 || value > max 
      max = value
      max_object = arr[index]
    end
  end

  max_object
end

puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil