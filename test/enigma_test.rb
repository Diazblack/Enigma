require './test/minitest_helper.rb'
require './lib/key.rb'
require './lib/enigma.rb'
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
      " ",
      ".",
      ","
      ]
    assert_equal expected, e.dictionary
  end

  def test_if_it_can_get_a_date_today
    e = Enigma.new
    date = Date.parse('27-8-2018')
        #the espected value have to be ajusted acording
        # of the current date
      assert_equal 270818, e.get_date(date)
  end

  def test_if_it_can_square_the_date_get_the_last_for_numbers
    e = Enigma.new
    date = Date.parse('27-8-2018')

    assert_equal [9,1,2,4], e.get_last_numbers(date)
  end

  def test_if_it_can_get_the_posicion_a_letter_with_a_position_greater_than_78
    e = Enigma.new
    date = Date.parse('27-8-2018')

    assert_equal "b" , e.get_letter(79)
  end

  def test_if_it_can_encrypt_a_word

    e = Enigma.new
    date = Date.parse('27-8-2018')

    assert_equal "b5f2s6phvvjoad qz", e.encrypt("this is a message", "12345", date )
  end


  def test_if_it_can_decrypt_a_word

    e = Enigma.new
    date = Date.parse('27-8-2018')

    assert_equal "this is a message", e.decrypt( "b5f2s6phvvjoad qz", "12345", date )
  end

end
