# frozen_string_literal: true

# Advent of Code Day 5: Supply Stacks
class SupplyStacks
  Error     = Class.new(StandardError)
  FileError = Class.new(Error)

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @file_path = file_path
    @version = version
  end

  def call
    @version == 1 ? version_one : version_two
  end

  private

  def version_one
    File.open(@file_path, 'r') do |file|
      stack_count = num_stacks(file)
      puts stack_count.inspect
    end
    # step 2: parse the moves into instructions
    # step 3: excecute the instructions
    # step 4: return the final value from each stack
  end

  def num_stacks(file)
    first_line = file.each_line.find do |line|
      line.match(/\d/)
    end
    first_line.strip.split.last.to_i
  end
end
