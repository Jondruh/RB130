items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*group, single|
  puts group.join(", ")
  puts single
end

gather(items) do |first, *group, last|
  puts first
  puts group.join(", ")
  puts last
end

gather(items) do |first, *group|
  puts first
  puts group.join(", ")
end

gather(items) do |item, item2, item3, item4|
  puts [item, item2, item3, item4].join(", ")
end