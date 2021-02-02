# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

=begin
*******************************************************************************
Problem: (Explicit Rules)
- the string  that returns a string that alternate chars upcase/downcase but ignorese non alpha chars when determining which chars to inverse

Example Test Cases (Implicit Rules):
- non alpha chars do not contribute when alternating up/downcase

Data Structure:
- Input
  - string
- Output
  - string with alternating up/down case

Algorithm:
initialize empty string or array(ima do array try again using string)
split string by char

iterate through array
  if last item in new array is up /downcase, alternate.
  if char is non alpha move to next char

return array.join
-
*******************************************************************************
=end

def previous code from part 1
def staggered_case(string)
  chars_arr = string.chars
  staggered_chars = []
  last_letter = ''
  chars_arr.each do |char|
    if char.match?(/[^a-zA-Z_]/)
      staggered_chars << char
    else
      if staggered_chars.empty?
        staggered_chars << char.upcase
        last_letter = char.upcase
      elsif last_letter == last_letter.upcase
        staggered_chars << char.downcase
        last_letter = char.downcase
      else
        staggered_chars << char.upcase
        last_letter = char.upcase
      end
    end
  end
  staggered_chars.join
end

#LS Solution
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    puts "#{char}, before regex"
    if char =~ /[a-z]/i
      p "#{char}, inside regex"
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
