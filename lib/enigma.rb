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

  def get_last_numbers(date)
    last_numbers = (get_date(date) ** 2).to_s
    last = last_numbers[-4..-1]
    last_four = []

    last.each_char do |char|
      last_four << char.to_i
    end
    last_four
  end

  def get_letter(sum)
    number = sum / @dictionary.count
    overflow = sum - @dictionary.count * number
    @dictionary[overflow]
  end

  def encrypt(my_message, key = get_random, date = Date.today)
    offset = get_rotation(key, get_last_numbers(date))
    encrypt =""

    my_message.each_char.with_index do |letter, i|
      sum  = @dictionary.index(letter) + offset[i % 4]
      encrypt += get_letter(sum)
    end
    encrypt
  end

  def reverse_letter(sum)
    diference = @dictionary.count + 1
    # number = sum / @dictionary.count
    overflow =  sum + @dictionary.count 
    @dictionary[overflow]
  end

  # def decrypt(my_message, key, date)
  #
  # end
end
