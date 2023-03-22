# frozen_string_literal: true

# an analyzer for rock-paper-scissors strategy guides
class StrategyAnalyzer
  OPPONENT_ROCK     = "A"
  OPPONENT_PAPER    = "B"
  OPPONENT_SCISSORS = "C"

  ROCK     = "X"
  PAPER    = "Y"
  SCISSORS = "Z"

  LOSE = "X"
  DRAW = "Y"
  WIN  = "Z"

  # scoring system
  # Part 1
  # 1 for Rock, 2 for Paper, and 3 for Scissors based on shape _WE_ picked +
  # outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won)
  # Part 2
  # X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win.
  SCORES = {
    [OPPONENT_ROCK, ROCK] => 4,
    [OPPONENT_ROCK, PAPER] => 8,
    [OPPONENT_ROCK, SCISSORS] => 3,
    [OPPONENT_PAPER, ROCK] => 1,
    [OPPONENT_PAPER, PAPER] => 5,
    [OPPONENT_PAPER, SCISSORS] => 9,
    [OPPONENT_SCISSORS, ROCK] => 7,
    [OPPONENT_SCISSORS, PAPER] => 2,
    [OPPONENT_SCISSORS, SCISSORS] => 6,
  }

  SCORES_2 = {
    [OPPONENT_ROCK, LOSE] => 3, # scissors
    [OPPONENT_ROCK, DRAW] => 4, # rock
    [OPPONENT_ROCK, WIN] => 8, # paper
    [OPPONENT_PAPER, LOSE] => 1, # rock
    [OPPONENT_PAPER, DRAW] => 5, # paper
    [OPPONENT_PAPER, WIN] => 9, # scissors
    [OPPONENT_SCISSORS, LOSE] => 2, # paper
    [OPPONENT_SCISSORS, DRAW] => 6, # scissors
    [OPPONENT_SCISSORS, WIN] => 7, # rock
  }

  Error     = Class.new(StandardError)
  FileError = Class.new(Error)

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @file_path = file_path
    @scoring_scheme = version == 1 ? SCORES : SCORES_2
  end

  def call
    score_file
  end

  private

  def score_file
    File.open(@file_path, "r")
      .each_line
      .lazy
      .map(&:split) # e.g. [["A", "Y"], ["B", "X"], ["C", "Z"]]
      .sum{|op| @scoring_scheme[op]}
  end
end