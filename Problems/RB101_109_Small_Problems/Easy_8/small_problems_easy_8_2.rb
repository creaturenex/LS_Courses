# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.


=begin
*******************************************************************************
Problem: (Explicit Rules)
- create a program that takes input from the user and returns a string(sentence)

Example Test Cases (Implicit Rules):
- need a noun, verb, adjective, and adverb from the user
-

Data Structure:
- Input
  - (string) need a noun, verb, adjective, and adverb from the user
- Output
  - (string) a sentence

Algorithm:
- create a message prompt method to display information to the user

- save input from user

- output madlib sentence using input
*******************************************************************************
=end

def prompt(message)
  puts "=> #{message}"
end

def madlib(nou, ver, adj, adv)
  prompt "Do you #{ver} your #{adj} #{nou} #{adv}? That's hilarious!"
end

prompt "Welcome to Mad Libs"

prompt "Please type a noun"
noun = gets.chomp

prompt "Please type a verb"
verb = gets.chomp

prompt "Please type a adjective"
adjective = gets.chomp

prompt "Please type a adverb"
adverb = gets.chomp

madlib(noun, verb, adjective, adverb)


# Example
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!
