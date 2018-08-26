require 'simplecov'
SimpleCov.start

# Previous content of test helper now starts here

class Enigma
attr_reader :dictionary,
            :key,
            :offset

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
     "0",
     " ",
     ".",
     ","
    ]
    @key        = []
    @offset     = []
  end

  def get_key(string)
    4.times do |number|
      @key << (string[number] + string[number + 1]).to_i
   end
   @key
  end

  def get_offset(key, date)
    4.times do |number|
      @offset << key[number] + date[number]
    end
    @offset
  end

  def get_random
    rand(99999)
  end

  def get_date(date)
    date_array = date.strftime("%m/%d/%Y").split("/")
      date_array.map do |date|
        if date.length > 2
          (date.to_i)-2000
        else
          date
        end
      end.join.to_i
  end

end
