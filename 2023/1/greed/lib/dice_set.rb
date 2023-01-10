# frozen_string_literal: true

# a class to track and score a set of dice for the Greed game
class DiceSet
  Error         = Class.new(StandardError)
  ArgumentError = Class.new(Error)

  COMBINATION_POINTS = {
    [1, 1, 1] => 1000,
    [2, 2, 2] => 200,
    [3, 3, 3] => 300,
    [4, 4, 4] => 400,
    [5, 5, 5] => 500,
    [6, 6, 6] => 600,
    [1] => 100,
    [2] => 0,
    [3] => 0,
    [4] => 0,
    [5] => 50,
    [6] => 0,
  }.freeze

  def initialize
    @values = []
  end

  def values
    @values.dup
  end

  def values=(array)
    raise(ArgumentError, "must be an array") unless array.is_a? Array
    raise(ArgumentError, "must contain valid values") unless valid?(array)

    @values = array
  end

  def valid?(array)
    array.all? { |value| value.is_a?(Integer) } && array.all?(1..6)
  end

  def roll(amount: 5)
    amount.times { @values << rand(1..6) }
  end

  def score(array: @values)
    return 0 if array.empty?
    return COMBINATION_POINTS[array] if COMBINATION_POINTS[array]

    # [1,2,1,1] => turn this into a base case? [1,1,1] [2]

    # [1,1,1,1] => [1,1,1] [1]

    # [5, 5, 5, 5, 5] => [5,5,5] [5] [5]

    # [2,2,2]         == 300
    # [1,2,2,2,1,1,1] == 1_700
    # [6,6,6,1]       == 700
    # if array.uniq.length == array.length
  end
end
