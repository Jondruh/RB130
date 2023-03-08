=begin
PROCESS
given a decimal number
return the roman numeral equlivalent as a string

If a smaller roman numeral comes before a larger roman numeral it subtracts from the the total.

EXAMPLES
IV = 4
VI = 6

ALGORITHM
starting from the largest key in the roman numeral lineup
divide the given decimal by the key
  if the difference between the remainder and the key is 1
    place an I and that value
  if that division result is greater than 1
    add that many of that letter to the string to be returned
    save the remainders as our new decimal number
  if that division is less than 1 
    go to the next key

if result of dividing the current number by the current value is greater than 1
  roman_string << value for the value
  the new current number is the remainder
if the result of subtracting the remainder from the current value is less than the next value
  do the subtraction thing with the next number


OR just hardcode it


=end
  
class RomanNumeral
  DEC_TO_ROM = {  4 => "IV", 1 => "I", 5 => "V", 
                  9 => "IX", 10 => "X", 40 => "XL", 
                  50 => "L", 90 => "XC", 100 => "C", 
                  400 => "CD", 500 => "D", 900 => "CM", 
                  1000 => "M" 
                }

  def initialize(num)
    @num = num
  end

  def to_roman
    roman_string = ""
    dec = @num

    sorted_hash = DEC_TO_ROM.sort_by { |key, value| key }.to_h

    sorted_hash.reverse_each do |key, value|
      result, remainder = dec.divmod(key)

      if result > 0
        result.times { roman_string << value }
        dec = remainder
      end

      break if dec == 0
    end

    roman_string
  end
end

