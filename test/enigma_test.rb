require 'simplecov'
SimpleCov.start

# Previous content of test helper now starts here


require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma.rb'
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
      " ",
      ".",
      ","
      ]
    assert_equal expected, e.dictionary
  end

  def test_if_it_can_get_rotation_with_string_and_date
    e = Enigma.new

    assert_equal [21,24,36,49],
    e.get_rotation("12345", [9, 1, 2, 4])
  end

  def test_if_it_can_a_random_number
    e = Enigma.new

    random = e.get_random
    #there's a tiny possibility that random_test might fail
    refute_equal random, e.get_random
  end


  def test_if_it_can_get_a_date_today
    e = Enigma.new
    date = Date.today
        #the espected value have to be ajusted acording
        # of the current date
      assert_equal 270818, e.get_date(date)
  end

  def test_if_it_can_square_the_date_get_the_last_for_numbers
    e = Enigma.new
    date = Date.today

    assert_equal [9,1,2,4], e.get_last_numbers(date)
  end

  def test_if_it_can_encrypt_one_letter
    e = Enigma.new
    date = Date.today

    assert_equal "b", e.encrypt_letter("t", "12345", date )
  end

  def test_if_can_rotate_word
    e = Enigma.new
    date = Date.today

    assert_equal [40,31,44,67,21], e.rotate_word("thisa",[21,24,36,49,9])
  end

  def test_if_it_can_encrypt_a_word
    skip
    e = Enigma.new
    date = Date.today

    assert_equal "b5f2", e.encrypt("this", "12345", date )
  end

end
