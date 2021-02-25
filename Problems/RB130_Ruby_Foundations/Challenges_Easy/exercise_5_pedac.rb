# Scrabble Score
# Write a program that, given a word, computes the Scrabble score for that word.

# Letter Values

# You'll need the following tile scores:

# Letter	Value
# A, E, I, O, U, L, N, R, S, T	1
# D, G	2
# B, C, M, P	3
# F, H, V, W, Y	4
# K	5
# J, X	8
# Q, Z	10
# How to Score

# Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

# 3 points for C
# 1 point for each A (there are two)
# 3 points for B (there are two)
# 2 points for G
# 1 point for E
# Thus, to compute the final total (14 points),
# we count:
# 3 + 2*1 + 2*3 + 2 + 1
# => 3 + 2 + 6 + 3
# => 5 + 9
# => 14

=begin
*******************************************************************************
Problem: (Explicit Rules)
- Given a word, computes the scabble score for that word.
  we need to get a total score
Example Test Cases (Implicit Rules)(Examples Below):
- see test cases

  - Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

  3 points for C
  1 point for each A (there are two)
  3 points for B (there are two)
  2 points for G
  1 point for E

  3 + 2*1 + 2*3 + 2 + 1
  => 3 + 2 + 6 + 3
  => 5 + 9
  => 14
  final score

Data Structure:
- Input
  - string ie word
- Output
  - integer ie score

Algorithm: How I would solve this?
- use a hash to keep track of the letter and their value

- result = 0
- for each letter in the word,
  - from hash, select only values ie array of letter ie [[],[]]
    for each array, if array include? letter return hash.key[array]?
      result += score
      return score

Code:
- Below
*******************************************************************************
=end
