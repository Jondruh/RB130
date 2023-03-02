# given a from and to for a range and step value
# we want to return nil?

# yield to a block passing in the current value 
# This yield should happen until the value exceeds the to amount
  
def step(from, to, step)
  value = from
  until value > to
    yield(value)
    value += step
  end
  nil
end
  
step(1, 10, 3) { |value| puts "value = #{value}" }