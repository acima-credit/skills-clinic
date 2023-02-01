# frozen_string_literal: true

class CalorieMaximizer
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    # 1. read in the file (by line? or as a single string)
    a = File.open(@file_path, "r").each_line.lazy.map(&:to_i).split(0)
    puts a
  end
end
