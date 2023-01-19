# frozen_string_literal: true

class CalorieMaximizer
  def initialize(file_relative_path:)
    @source = "#{File.expand_path(File.dirname(__FILE__))}#{file_relative_path}"
  end

  def call
    # One liners are dirty, but I modified to include the elf #, so we wont use the original solution
    # File.read(@source).split("\n\n").map{ |calories| calories.split.map(&:to_i).sum } .max

    # This is a bit more readable
    input = File.read(@source)
    calories = input.split("\n\n")
    calories.map.with_index do |calories, idx|
      [calories.split.map(&:to_i).sum, idx + 1]
    end.max
  rescue Errno::ENOENT => e
    {
      status: :file_read_error,
      message: 'No such file or directory',
      code: e.class.name
    }
  end

  def self.call
    new.call
  end
end
