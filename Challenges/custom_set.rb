=begin
Our custom set only needs to hold integers.
Our custom set should be able to be initialized empty or with arguments

Our custom set should not be able to have duplicates?

need these methods
#contains?
#empty?
#subset?
  returns true if the calling set is a subset of the set passed to #subset?
#disjoint?
  disjoint compares two sets and returns true if none of their elements equal each other
#eql?
  returns true if the calling set and the argument set have the same values regardless of order
#add 
#intersection(other_set)
  returns a new set of all the elements that the calling set and other_set have in common
#difference(other_set)
  returns a new set of all the elements that the calling set and other_set don't have in common
#union 
  returns a new set of all the elements that each set contains (without duplicates)
  
=end

class CustomSet
  def initialize(starting_set = [])
    @set = starting_set.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(ele)
    set.include?(ele)
  end

  def subset?(other)
    return true if empty?
    set.all? { |ele| other.set.include?(ele) }
  end

  def disjoint?(other)
    set.intersection(other.set).empty?
  end

  def eql?(other)
    self == other
  end

  def add(ele)
    set << ele unless set.include?(ele)
    self
  end

  def ==(other)
    set.sort == other.set.sort
  end

  def intersection(other)
    CustomSet.new(set.intersection(other.set))
  end

  def difference(other)
    CustomSet.new(set - other.set)
  end

  def union(other)
    CustomSet.new(set.union(other.set))
  end

  protected
  attr_reader :set

end