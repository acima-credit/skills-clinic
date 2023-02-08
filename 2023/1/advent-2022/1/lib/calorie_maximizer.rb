# frozen_string_literal: true

class CalorieMaximizer
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    File.open(@file_path, "r").each_line.lazy.map(&:to_i).chunk(&:positive?).select(&:all?).map(&:last).map(&:sum).max || 0
  end
end
