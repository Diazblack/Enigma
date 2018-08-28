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

  def encrypt_letter(my_message, key, date)
    letter_position = @dictionary.index(my_message)
    last_four = get_last_numbers(date)
    offset = get_rotation(key, last_four)
    new_position = letter_position + offset[0]
    if new_position > 39
      position = new_position - 39
      @dictionary[position]
    else
      @dictionary[new_position]
    end
  end
  ##
  def get_new_position(original_position, offset)

    original_position + offset
  end
##
  def save_new_position(new_position)
    dic_lenght = @dictionary.count

    if new_position >= dic_lenght && new_position < dic_lenght * 2
      new_position - dic_lenght
    elsif new_position > dic_lenght * 2
        new_position - dic_lenght * 2
    else
      new_position
    end
  end

  def rotate_word(word, offset)
    word.chars.map.with_index do |letter, i|
      new_position = get_new_position(@dictionary.index(letter), offset[i])
      save_new_position(new_position)
    end
  end

  def get_letter(encrypt, sum)
    if sum > @dictionary.count
      overflow = sum - @dictionary.count
      encrypt + @dictionary[overflow - 1]
    else
      encrypt + @dictionary[sum - 1]
    end
  end

  def encrypt(my_message, key, date)
    offset = get_rotation(key, get_last_numbers(date))
    encrypt =""
    my_message.each_char.with_index do |letter, i|
      sum  = @dictionary.index(letter) + offset[i % 4]
      encrypt = get_letter(encrypt, sum)
    end
    encrypt
  end

  # def decrypt(my_message, key, date)
  #   offset = get_rotation(key, get_last_numbers(date))
  #   decrypt =""
  #   my_message.each_char.with_index do |letter, i|
  #     sum  = @dictionary.index(letter) + offset[i % 4]
  #     decrypt = get_letter(decrypt, sum)
  #   end
  #   decrypt
  # end
end
