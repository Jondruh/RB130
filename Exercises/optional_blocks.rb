def compute(arg=nil)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

puts compute(3) { |num| 5 + 3 + num } == 11
puts compute { |arg| "#{arg}" + 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'