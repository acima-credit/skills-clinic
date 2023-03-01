# frozen_string_literal: true

# an analyzer for rock-paper-scissors strategy guides
class StrategyAnalyzer
  OPPONENT_ROCK     = "A"
  OPPONENT_PAPER    = "B"
  OPPONENT_SCISSORS = "C"

  ROCK     = "X"
  PAPER    = "Y"
  SCISSORS = "Z"

  SCORES = {
    [OPPONENT_ROCK, PAPER] => 8,
    [OPPONENT_PAPER, ROCK] => 1,
  }

  Error     = Class.new(StandardError)
  FileError = Class.new(Error)

  def initialize(file_path:)
    raise FileError unless File.exist?(file_path)

    @file_path = file_path
  end

  def call
  end

  private

  def parse_file(file_path)
    File.open(file_path, "r")
      .each_line
      .lazy
      .map(&:split)
      # [["A", "Y"], ["B", "X"], ["C", "Z"]]
  end
end
