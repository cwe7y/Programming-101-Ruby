class Fixnum
  
 ROMAN_NUMBERS = {  1 => "I",
                    4 => "IV",
                    5 => "V",
                    9 => "IX",
                    10 => "X",
                    40 => "XL",
                    50 => "L",
                    90 => "XC",
                    100 => "C",
                    400 => "CD",
                    500 => "D",
                    900 => "CM",
                    1000 => "M" }

  def roman
    n = self
    roman = ""
    ROMAN_NUMBERS.each do |value, letter|
      roman << letter*(n / value)
      n = n % value
  
    end
      return roman
  end
end