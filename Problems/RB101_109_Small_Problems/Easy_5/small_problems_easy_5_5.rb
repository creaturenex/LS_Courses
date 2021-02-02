# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_5_5.rb

# Given a string that consists of some words (all lowercased) and an assortment
# of non-alphabetic characters, write a method that returns that string with
# all of the non-alphabetic characters replaced by spaces. If one or more non-
# alphabetic characters occur in a row, you should only have one space in the
# result (the result should never have consecutive spaces).

# Examples:
# cleanup("---what's my +*& line?") == ' what s my line '

# first solution but delete duplicate letters

# alpha_str_ary.select.with_index { |char, index| char != alpha_str_ary[index+1] }.join

def cleanup(str)
  str_ary = str.chars

  alpha_str_ary = str_ary.map do |char|
    case char
    when ('a'..'z')
      char
    else
      ' '
    end
  end

  final = alpha_str_ary.map.with_index do |char, index|
    case index
    when 0
      final = alpha_str_ary[0]
    else
      case char
      when ' '
        char if alpha_str_ary[index - 1] != ' '
      else
        char
      end
    end
  end

  p final.join
end

cleanup("---what's my +*& line?") # == ' what s my line '

# need to refactor this code
