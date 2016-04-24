#require "byebug"

class Integer

  NUM_WORD = {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
  }

  def in_words
    words = ""
    digits = number_to_number_array(self)
    power = 0
    flag_special_teens_case = false
    flag_special_rty_case = false

    digits.each_with_index do |digit, index|
      power = digits.size - index - 1

      #handle special cases (0's, teen numbers, etc.)
      if flag_special_teens_case
        flag_special_teens_case = false
        words += choose_power_word(power)
        next

      elsif flag_special_rty_case
        flag_special_rty_case = false
        words += choose_power_word(power)
      end

      if digit == 0 && digits.size > 1
        next
      end

      if power == 0
        words += NUM_WORD[digit] + " "

      elsif power % 3 == 1
        if digit == 1
          words += NUM_WORD[concat_nums(digit, digits[index + 1])] + " "
          flag_special_teens_case = true

        elsif digits[index + 1].to_s.to_i == 0
          words += NUM_WORD[digit * 10] + " "
          flag_special_rty_case = true

        else
          words += NUM_WORD[digit * 10] + " "
        end

      elsif power % 3 == 2
        words += NUM_WORD[digit] + " hundred "

      elsif power >= 3
        words += NUM_WORD[digit] + " " + choose_power_word(power)
      end
    end

    words[0..-2]
  end

end

def choose_power_word(power)
  case power
  when 3
    return "thousand "
  when 6
    return "million "
  when 9
    return "billion "
  when 12
    return "trillion "
  else
    ""
  end
end

def number_to_number_array(num)
  digits = num.to_s.split("")

  digits.collect! do |char|
    char.to_i
  end

  digits
end

def concat_nums(num1, num2)
  (num1.to_s + num2.to_s).to_i
end

#p "1_888_259_040_036 = #{1_888_259_040_036.in_words}"
#p "10_820_230_040_050 = #{10_820_230_040_050.in_words}"
#p "50_812_213_014_015 = #{50_812_213_014_015.in_words}"
