require './test/minitest_helper'
require './lib/key'


class KeyGeneratorTest < Minitest::Test

  def test_it_exists
    key = KeyGenerator.new

    assert_instance_of KeyGenerator, key
  end


    def test_if_it_has_attributes
      keys = KeyGenerator.new

      assert_equal [], keys.key
      assert_equal [], keys.date
    end

  def test_if_it_can_get_rotation_with_string_and_date
    key = KeyGenerator.new

    assert_equal [21,24,36,49],
    key.get_rotation("12345", [9, 1, 2, 4])
  end

  def test_if_it_can_add_random_number
    key = KeyGenerator.new

    random = key.get_random
    #there's a tiny possibility that random_test might fail
    refute_equal random, key.get_random
  end
end
