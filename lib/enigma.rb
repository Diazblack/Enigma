
require './lib/key.rb'
require './lib/get_date'

class Enigma
attr_reader :dictionary
            :key

  def initialize (key = KeyGenerator.new)
    @dictionary =[
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
    @key        = key

  end

  def get_date(date)
    current_day = GetDate.new(date)
    current_day.get_date
  end
  
  def get_last_numbers(date)
    current_day = GetDate.new(date)
    current_day.get_last_numbers
  end

  def get_letter(sum)
    number = sum / @dictionary.count
    overflow = sum - @dictionary.count * number
    @dictionary[overflow]
  end

  def encrypt(my_message, key = get_random, date = Date.today)
    offset = @key.get_rotation(key, get_last_numbers(date))
    encrypt =""

    my_message.each_char.with_index do |letter, i|
      sum  = @dictionary.index(letter) + offset[i % 4]
      encrypt += get_letter(sum)
    end
    encrypt
  end

  def decrypt(my_message, key, date)
    offset = @key.get_rotation(key, get_last_numbers(date))
    encrypt =""

    my_message.each_char.with_index do |letter, i|
      sum  = @dictionary.index(letter) - offset[i % 4]
      encrypt += get_letter(sum)
    end
    encrypt
  end
end
