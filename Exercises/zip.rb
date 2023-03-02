def zip(arr1, arr2)
  zipped = [] 
  arr1.each_with_index do |ele, ind|
    zipped << [ele, arr2[ind]]
  end
  zipped
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]