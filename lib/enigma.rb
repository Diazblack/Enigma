require 'simplecov'
SimpleCov.start

# Previous content of test helper now starts here
require 'date'

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
     "0",
     " ",
     ".",
     ","
    ]


  end

  def rotate_key(string)
    keys = []
    4.times do |number|
      keys << (string[number] + string[number + 1]).to_i
   end
   keys
  end

end
