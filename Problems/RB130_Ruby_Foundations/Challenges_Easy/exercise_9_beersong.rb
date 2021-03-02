class BeerSong
  def self.verse(num)
    num.zero? ? zero_bottles : x_bottles(num)
  end

  def self.verses(start, finish)
    verses = []
    count = start
    (start - finish).times do
      verses << verse(count)
      count -= 1
    end
    verses.join("n/")
    # originally did not use array
  end

  # add array join
  def self.lyrics
    count = 99
    puts "<<-SONG"
    100.times do
      if count == 0
        zero_bottles
      else
        x_bottles(count)
        puts ''
      end
      count -= 1
    end
    puts "SONG"
  end

  def self.x_bottles(num)
    case num
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
  end

  def self.zero_bottles
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

end


p BeerSong.verses(99, 98)
