require 'minitest/autorun'

class Test
  def initialize(name)
    @name = name
  end
end

class TestTest < Minitest::Test
  def test_raises
    assert_raises do
      Test.new
    end
  end
end