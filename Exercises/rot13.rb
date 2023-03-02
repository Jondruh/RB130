# given a list of encrypted names
# return a list of unencrypted names

# Take each name and rotate each letter 13 positions backward in the alphabet
# a becomes n
# wrap around the end of the alphabet

# create a constant where 1 - 26 are keys for a-z values
# iterate over each letter of the encrypted name
# for each letter
#   if that letter is capital set capital to true
#   find the key of the letter in the constant
#   subtract 13 from that value
#     if that subtraction value is less than 0.
#       the new value is 26 + that 0 or negative number
#     otherwise, the value is the result of the subtraction
#   find the the letter value for that subtraction
#   check if capital flag is true and return the letter in the correct case
#
# 

require 'pry'

ALPHABET = ('a'..'z').to_a
key = {}
ALPHABET.each_with_index { |letter, index| key[letter] = index }



names = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu".split("\n")


names.map! do |name|
  name.chars.map do |letter|
    
    if ALPHABET.include?(letter.downcase)
      upcase = ('A'..'Z').include?(letter)
      letter_value = key[letter.downcase]
      new_value = nil

      if letter_value - 13 < 0
        new_value = 26 + (letter_value - 13)
      else
        new_value = letter_value - 13
      end
      
      new_letter = key.key(new_value)
    
      new_letter = new_letter.upcase if upcase
      new_letter
    else
      letter
    end 
  end.join
end

p names
