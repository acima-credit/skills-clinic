# frozen_string_literal: true

# a class to track and score a set of dice for the Greed game
class DiceSet
  Error         = Class.new(StandardError)
  ArgumentError = Class.new(Error)

  def initialize
    @values = []#.freeze
  end

  def values
    @values
  end

  def values=(arr)
    raise(ArgumentError, "must be an array") unless arr.is_a? Array

    @values = arr
  end

  def roll(amount: 5)
    amount.times { @values << rand(1..6) }
  end
end
