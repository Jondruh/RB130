require 'minitest/autorun'
require_relative 'swap_letters'

class Test < Minitest::Test
  def setup
    @file = File.open("sample.txt")
  end

  def test_swap
    read = @file.read
    text = Text.new(read)
    swapped = read.gsub('a', 'e')
    assert_equal swapped, text.swap('a', 'e')
  end

  def test_word_count
    read = @file.read
    text = Text.new(read)
    count = read.split.count

    assert_equal count, text.word_count
  end
  
  def teardown
    @file.close
  end
end