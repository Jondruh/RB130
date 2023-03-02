#find the value of a given number of factorials from 0 to the given number
#first 2 should be 1 as 0! = 1 and 1! = 1
#all others should be: 2! = 2 * 1 = 2
#3! = 3 * 2 * 1 = 6
# factorials = Enumerator.new do |y|
#   y << 1
#   y << 1

#   current_num = 2

#   loop do
#     fact = current_num.downto(1).inject(:*)
#     y << fact
#     current_num += 1
#   end
# end

factorials = Enumerator.new do |y|
  accumulator = 1
  number = 0

  loop do
    number.zero? ? accumulator = 1 : accumulator *= number
    y << accumulator
    number += 1
  end
end

puts factorials.take(7)

factorials.rewind
puts factorials.take(6) == [1, 1, 2, 6, 24, 120]

factorials.each_with_index do |fact, ind|
  puts "#{ind}! = #{fact}"
  break if ind > 9
end