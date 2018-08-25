require 'simplecov'
SimpleCov.start

# Previous content of test helper now starts here


require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'date'
require 'pry'
class EnigmaTest < Minitest::Test

  def test_if_it_exists
    e = Enigma.new

    assert_instance_of Enigma, e
  end

  def test_if_it_has_attributes
    e = Enigma.new

    expected =[
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "q",
      "r",
      "s",
      "t",
      "u",
      "v",
      "w",
      "x",
      "y",
      "z",
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "0",
      " ",
      ".",
      ","
      ]
    assert_equal expected, e.dictionary
    assert_equal [], e.key
    assert_equal [], e.offset
  end

  def test_if_it_can_get_a_key
      e = Enigma.new

      assert_equal [12, 23, 34, 45],
      e.get_key("12345")
  end

  def test_if_it_can_get_offset
      e = Enigma.new

      assert_equal [21,24,36,49],
      e.get_offset([12, 23, 34, 45], [9, 1, 2, 4])

  end

  def test_if_it_can_a_random_number
      e = Enigma.new

      random = e.get_random
      #there's a tiny possibility that random_test might fail
      refute_equal random, e.get_random
  end

end
