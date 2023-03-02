# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# Procs don't care if they're passed an argument. The block paremeter will be nil if
# they aren't passed an argument

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# lambdas are not a sub-class of proc. They are procs. They have strict arity and will throw errors if
# arguments are expected and not given. Per the Ruby docs they are equivalent to `Proc.new` except
# the proc object created will check the number of parameters passed when called.

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# methods that take a block and explictly `yield` to the block will throw an error if no block is provided
# The arguments passed to the method have to be passed to the block when `yield` is called for the block
# to have access to them, However the block doesn't care if an argument is passed in for each of it's
# parameters and the parameter value will be nil if no block is passed in. As seen in group 4 the arguements
# passed to a block with `yield` will be assigned to block parameters however the number does not have to 
# match

# # Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}


# To summarize: The difference between Procs and Lambdas are that Lambdas are actually Procs that care
# about the number of arguments passed to them. Methods care about the number of arguments passed to them,
# but a block passed to a method does not care about the number of arguments passed to it. Procs and Lambdas
# also have access by default to the arguments passed into a call while a method with a block needs to 
# explicitly pass the method arguments to the block for the block to have access.
# 