items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items) if block_given?
  puts "Nice selection of food we've gathered."
end 

gather(items) do |food|
  puts food.join(", ")
end