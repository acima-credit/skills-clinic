# frozen_string_literal: true

require_relative 'instruction'

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
    @stacks = Array.new(stack_count) { [] }
    parse(stack_count)

    # step 3: excecute the instructions
    # step 4: return the final value from each stack
  end

  def parse(stack_count)
    File.open(@file_path, 'r') do |file|
      stacks(file, stack_count)
      @instructions = get_instructions(file)
    end
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
    file.each_line do |line|
      break unless line.match?(/\[/)

      current_row = line_into_stacks(line, stack_count)
      @stacks.map!.with_index do |stack, stack_index|
        character = current_row[stack_index]
        character ? [character] + stack : stack
      end
    end
  end

  def line_into_stacks(line, stack_count)
    (0...stack_count).map do |stack_index|
      character_index = (stack_index * 4) + 1
      character = line[character_index]
      character =~ /[A-Z]/ ? character : nil
    end
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
