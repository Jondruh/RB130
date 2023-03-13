=begin
  each verse:
  line + newline
  line + newline

when two verses get joined put a new line between them
=end

class BeerSong
  def self.verse(verse)
    if verse == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif verse == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif verse == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{verse} bottles of beer on the wall, #{verse} bottles of beer.\n" \
      "Take one down and pass it around, #{verse - 1} bottles of beer on the wall.\n"
    end
  end

  def self.verses(start_verse, finish_verse)
    (finish_verse..start_verse).each_with_object([]) do |current_verse, song|
      song.unshift(verse(current_verse))
    end.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
  