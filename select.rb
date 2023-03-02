def select(array)
  new_array = []
  index = 0

  while index < array.length
    if yield(array[index])
      new_array << array[index]
    end

    index += 1
  end

  new_array
end

test = [1, 2, 3, 4, 5]

p select(test) { |num| num.odd? }
p select(test) { |num| puts num }
p select(test) { |num| num + 1 }