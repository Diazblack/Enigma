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

end
