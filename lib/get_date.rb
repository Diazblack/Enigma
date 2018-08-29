require 'date'

class GetDate
  attr_reader :summited_date

  def initialize(summited_date)
    @summited_date = summited_date
  end

  def get_date(date = @summited_date)
    date_array = date.strftime("%d/%m/%Y").split("/")

      date_array.map do |date|
        if date.length > 2
          date[-2..-1]
        else
          date
        end
    end.join.to_i
  end

  def get_last_numbers
    last_numbers = (get_date ** 2).to_s
    last = last_numbers[-4..-1]
    last_four = []

    last.each_char do |char|
      last_four << char.to_i
    end
      last_four
    end
end
