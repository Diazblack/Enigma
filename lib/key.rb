class KeyGenerator
attr_reader :key,
            :date

  def initialize
    @key  = []
    @date = []
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

end
