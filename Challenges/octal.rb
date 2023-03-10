=begin
PROCESS:
given an octal number
return the decimal equivalent

to convert a octal number to decimal
take each number place value and raise it to the places 8 power

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

3 is in the 1's place so 3 * 1
next 3 is in the 2's place so 3 * 8^1
2 is in the 3's place so 3 * 8^2

if any invalid input return a 0
  an invalid input is any octal number that contains 8 or 9
  or any input that contains non-numbers

  So any input that contains anything that isn't 0-7

ALGO
given an octal number

if not valid return 0

initialize a power_counter variable to 0
initialize a saved_result array

iterate over each digit from right to left
  put digit * (8 raised to power_counter) in saved_result array
  increment power_counter up one
end

sum all the saved_result array


=end
class Octal
  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if invalid_octal?

    power = 0

    @num.to_i.digits.reduce(0) do |total, num|
      decimal = num * (8 ** power)
      power += 1
      total += decimal
    end
  end

  private

  def invalid_octal?
    @num.match?(/[^0-7]/)
  end
end