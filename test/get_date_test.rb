require './test/minitest_helper'

require 'date'
require './lib/get_date'
require 'pry'

class GetDateTest < Minitest::Test

  def test_if_it_exists
    day = Date.parse('27-8-2018')
    today_date = GetDate.new(day)

    assert_instance_of GetDate, today_date
  end

  def test_if_it_has_attributes
    day = Date.parse('27-8-2018')
    today_date = GetDate.new(day)

    assert_equal day, today_date.summited_date
  end

  def test_if_it_can_get_a_date_by_default
    day = Date.parse('27-8-2018')
    today_date = GetDate.new(day)

    assert_equal 270818, today_date.get_date
  end

  def test_if_get_date_receive_arguments
    day = Date.parse('29-8-2018')
    today_date = GetDate.new(day)

    assert_equal 290818, today_date.get_date(day)
  end 

end
