=begin
PROCESS  
  Write a triangle class, that allows us to pass in 3 sides of a triangle and calculates for us
  what type of triangle it is. 

  If the triangle is not a valid triangle, raise an error
    -Any side is less than or eqaul to 0
    -If the sum of the length of any two of the three sides is not equal to or greater than the side

  Floats are a valid triangle side length

  Types of triangles:
    equilateral - All three sides are the same length
    isosceles - Two sides of the same length
    scalene - all three sides are different lengths
=end

class Triangle
  def initialize(a, b, c)
    @sides = [a, b, c]
    check_argument_validity
  end

  def kind
    if @sides.uniq.size == 1
      'equilateral'
    elsif @sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def check_argument_validity
    raise ArgumentError.new("All sides need to be greater than 0") if size_too_small?
    raise ArgumentError.new("The sum of two sides must be greater than the third side") if size_inequality?
  end

  def size_inequality?
    @sides.min(2).sum <= @sides.max
  end

  def size_too_small?
    @sides.any? { |side| side <= 0 }
  end
end 