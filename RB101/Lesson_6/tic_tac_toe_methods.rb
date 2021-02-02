def joinor(ary, join_by = ', ', last = 'or')
    if ary.count == 1
      ary[0].to_s
    elsif ary.count == 2
      ary.join(' ' + last)
    elsif ary.count >= 3
      final = ary.pop
      ary.each { |num| num.to_s}.join(join_by) + join_by + last + ' ' + final.to_s
    else
      #if array empty?
    end
end

p joinor([1])                   # => "1 or 2"
p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

p joinor([])





WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # row
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # column
                 [1, 5, 9], [3, 5, 7]] # diagonal

def ai_defense(brd)
  WINNING_LINES.each do |line|

    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      if brd.value_at(*line) == ' '
        brd[line.index(' ')] = COMPUTER_MARKER
      end
    end

    end
  end
  nil
end


#original attempt at AI_Defense

def computer_places_pieces!(brd)
  square = nil

  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      line.map do |marker|
        brd[marker.index(' ')] = COMPUTER_MARKER
      end
    else
      square = empty_squares(brd).sample
      brd[square] = COMPUTER_MARKER
    end
end















# I want to the computer to, if there's an immediate threat, to defend the 3rd square. We'll consider an "immediate threat" to be 2 squares marked by the opponent in a row. If there's no immediate threat, then it will just pick a random square.


WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # row
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # column
                 [1, 5, 9], [3, 5, 7]] # diagonal


                 def ai_defense(brd)
                  WINNING_LINES.each do |line|

                    if brd.values_at(*line).count(PLAYER_MARKER) == 2
                      if brd.value_at(*line) == ' '
                        brd[line.index(' ')] = COMPUTER_MARKER
                      end
                    end

                    end
                  end
                  nil
                end


def at_risk_square()
  WINNING_LINES.each do |line|

    if brd.values_at(*line).count(PLAYER_MARKER) == 2
   and line.*index




def computer_places_pieces!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end
