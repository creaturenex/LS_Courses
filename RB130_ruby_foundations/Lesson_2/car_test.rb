require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

# These are assertion ie Assert-Style Syntax
# uses methods for test

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip # notice keyword skip
    car = Car.new
    assert_equal(3, car.wheels)
  end
end

# These are expectation ie Spec-Style Syntax aka DSL
# uses blocks for test

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    car.wheels.must_equal 4           # this is the expectation
  end

end
