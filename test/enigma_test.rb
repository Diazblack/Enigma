require 'simplecov'
SimpleCov.start

# Previous content of test helper now starts here


require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'date'

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
  end

  def test_if_key_is_empty
    e = Enigma.new

    assert_equal nil, e.key
  end


    def test_if_it_can_todays_date
      e = Enigma.new

      assert_equal 25-08-2018, e.Date.today
    end

    def test_if_it_can_encrypt_one_digit
      e = Enigma.new

      assert_equal , e.encrypt(my_message, "1",)
    end





end
