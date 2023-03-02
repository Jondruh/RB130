class Tree
  include Enumerable    

  def each; end

  def <=>(other); end
end

test = Tree.new
p Tree.ancestors
test.each { |ele| puts "hi" }