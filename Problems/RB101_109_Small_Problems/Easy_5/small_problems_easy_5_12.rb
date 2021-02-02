# LS_Courses/Problems/RB101_109_Small_Problems/small_problems_easy_5_12.rb

# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

# Will the object returned be the same object or a new object?

# It will return a different object even though the values in the string was used as a reference and was created into an array when the split method was used which was then modified and returned
