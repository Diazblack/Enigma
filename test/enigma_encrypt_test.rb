require 'simplecov'
SimpleCov.start

# Previous content of test helper now starts here


require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma_encrypt'
require 'date'
require 'pry'
class EncryptTest < Minitest::Test

  def test_if_it_exists
    e = Encrypt.new

    assert_instance_of Encrypt, e
  end

  def test_if_it_has_attributes
    e = Encrypt.new

    assert_equal nil,
  end


end
