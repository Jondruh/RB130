def each(array)
  index = 0
  while index < array.length do
    yield(array[index])
    index += 1
  end

  array
end

int_array = [1,2,3]

test = each(int_array) do |ele|
  puts ele
end

p test
