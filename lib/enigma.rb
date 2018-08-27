require 'simplecov'
SimpleCov.start

# Previous content of test helper now starts here
require 'pry'


class Enigma
attr_reader :dictionary

  def initialize
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
  end

  def get_rotation(string, date)
    key = []
    4.times do |number|
      key << ((string[number] + string[number + 1]).to_i+ date[number])
    end
    key
  end

  def get_random
    rand(99999)
  end

  def get_last_numbers(date)

    last_numbers = (get_date(date) ** 2).to_s
    last = last_numbers[-4..-1]
    last_four = []
    last.each_char do |char|
      last_four << char.to_i
    end
    last_four
  end

  def get_date(date)
    date_array = date.strftime("%d/%m/%Y").split("/")
      date_array.map do |date|
        if date.length > 2
          date[-2..-1]
        else
          date
        end
      end.join.to_i
  end

  def encrypt(my_message, key, date)
    letter_position = @dictionary.index(my_message)
    last_four = get_last_numbers(date)
    offset = get_rotation(key, last_four)
    new_position = letter_position + offset[0]
    # binding.pry
    if new_position > 39
      position = new_position - 39
      @dictionary[position]
    else
      @dictionary[new_position]
    end


  end

























  # def get_positions(message)
    #   # letters = message.split("")
    #   # 1. iterate over each letter in letters
    #   # 2. make empty positions array
    #   # 3. dictionary[letter]; store this in positions(array)
    # end
    #
    # def normalize_positions(array_of_positions)
    #   # 1. iterate over get_positions
    #   # 2. loop:
    #   # 3. while number > 39, subtract 39
    # end
    #
    #  def encrypt(message, key, date)
    #   offset = get_offset(key)
    #   raw_positions = get_positions(message)
    #   letter_positions = normalize_positions(raw_positions)
    #   (length_of_postions 4).times do |number|
    #     decrypted_array_numbers << offset[number] + letter_position[number]
    #   end
    #     decrypted_array_numbers
    #     # 1. iterate over decrypted_array_numbers
    #     # 2. each number -> letter
    #     # 3. letters array -> string


end
