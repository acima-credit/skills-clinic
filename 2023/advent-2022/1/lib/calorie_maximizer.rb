# frozen_string_literal: true

# Maximize Calories
class CalorieMaximizer
  def initialize(file_path, elves: 1)
    @file_path = file_path
    @elves = elves
  end

  def call
    File.open(@file_path, 'r')
        .each_line
        .lazy
        .map(&:to_i)
        .chunk(&:positive?)
        .filter(&:all?)
        .map(&:last)
        .map(&:sum)
        .sort
        .last(@elves)
        .sum || 0
  end
end
