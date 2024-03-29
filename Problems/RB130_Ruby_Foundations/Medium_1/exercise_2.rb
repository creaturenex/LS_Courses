=begin
Text Analyzer - Sandwich Code

Fill out the rest of the Ruby code below so it prints output like that shown in "Sample Output." You should read the text from a simple text file that you provide. (We also supply some example text below, but try the program with your text as well.)

This question requires that you read a simple text file. Try searching the Web for information on how to do this, and also take a look at the File class in the Ruby documentation. If you can't figure it out on your own, don't worry: just put the data directly into your program; an Array with one element per line would be ideal.

Read the text file in the #process method and pass the text to the block provided in each call. Everything you need to work on is either part of the #process method or part of the blocks. You need no other additions or changes.

The text you use does not have to produce the same numbers as the sample output but should have the indicated format.
=end

# class TextAnalyzer
#   attr_accessor :text

#   def initialize(text, mode)
#     @text = File.open(text, mode).read
#   end

#   def process
#     yield(text)
#   end
# end

# analyzer = TextAnalyzer.new('/home/oscar/LaunchSchool/LS_Courses/Problems/RB130_Ruby_Foundations/Medium_1/exercise_2_sample_test.txt', "r")

# analyzer.process { |text| puts text.split("\n\n").count.to_s + " paragraphs" }
# analyzer.process { |text| puts text.split("\n").count.to_s + " lines" }
# analyzer.process { |text| puts text.split(" ").count.to_s + " words" }

# Output
# 3 paragraphs
# 15 lines
# 126 words


# LS Solution

# class TextAnalyzer
#   def process
#     file = File.open('sample_text.txt', 'r')
#     yield(file.read)
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
# analyzer.process { |text| puts "#{text.split("\n").count} lines" }
# analyzer.process { |text| puts "#{text.split(' ').count} words" }


File.open('/home/oscar/LaunchSchool/LS_Courses/Problems/RB130_Ruby_Foundations/Medium_1/exercise_2_sample_test.txt', "r") { |text| puts "#{text.read.split("\n\n").count} parapgraphs"}
