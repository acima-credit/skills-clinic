# frozen_string_literal: true

require 'instruction'

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
    stack_count = read_num_stacks
    File.open(@file_path, 'r') do |file|
      @stacks = stacks(file, stack_count)
      @instructions = get_instructions(file)
      puts "instructions #{@instructions.inspect}"
    end

    # step 3: excecute the instructions
    # step 4: return the final value from each stack
  end

  def read_num_stacks
    File.open(@file_path, 'r') do |file|
      first_line = file.each_line.find do |line|
        line.match(/\d/)
      end
      return first_line.strip.split.last.to_i
    end
  end

  def stacks(file, stack_count)
    @stacks = Array.new(stack_count) { [] }
    puts "stacks:"
    p @stacks
    file.each_line do |line|
      break if line.strip.empty?

      current_stack = line_into_stacks(line)
    #  (probably don't use this line) current_stacks.each_with_index { |element, index| @stacks[index] << element }
    end
  end

  def line_into_stacks(line)
    arr = []
    (line.length % 4).times do |x|
      counter = x * 4
      # current_segment = line[counter * 4...(counter + 1) * 4]
      arr[counter / 4] << line[counter + 1] if line[counter + 1] == /[A-Z]/
      p "letter #{line[counter + 1]}"
      # counter += 4
    end
    p "temparr #{arr}"
  end

  def get_instructions(file)
    moves = find_moves(file)
    moves.map { |move| Instruction.new(move) }
  end

  def find_moves(file)
    moves = []
    file.each_line do |line|
      moves << line if line.match?('move')
    end
    moves
  end
end

# stacks function starts reading line from the 4th line, not getting the stacks/characters we want