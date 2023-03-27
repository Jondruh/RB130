class Element
  attr_reader :datum, :next

  def initialize(data, next_ele = nil)
    @datum = data
    @next = next_ele
  end

  def tail?
    @next == nil
  end

  def test_s
    @datum
  end
end

class SimpleLinkedList

  def initialize(start = nil)
    @list = start
  end

  def self.from_a(start)
    return SimpleLinkedList.new if start.nil? || start.empty?

    list = SimpleLinkedList.new
    start.reverse_each { |ele| list.push(ele) }
    list
  end

  def to_a
    array = []
    each { |datum| array << datum } if @list
    array
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end

  def size
    size = 0
    each { size += 1 } if @list
    size
  end

  def head
    @list
  end

  def pop
    popped = head.datum
    @list = head.next
    popped
  end

  def empty?
    @list.nil?
  end

  def push(ele)
    @list = Element.new(ele, @list)
  end

  def peek
    @list ? @list.datum : nil
  end
  
  private 

  def each
    current_ele = @list
    
    while current_ele
      yield(current_ele.datum) if block_given?

      current_ele = current_ele.next
    end
  end
end

