require './test/minitest_helper'

require 'date'
require 'pry'
require './lib/enigma_runner'

class EnigmaRunnerTest < Minitest::Test

  def test_if_it_exists
    run = EnigmaRunner.new

    assert_instance_of EnigmaRunner, run
  end

end
