# frozen_string_literal: true

# Parse the moves into instructions
class Instruction
  def initialize(line)
    @quantity = @source = @destination = 0
    parse_line(line)
  end

  def parse_line(line)
    parts = line.split
    _, @quantity, _, @source, _, @destination = parts.map(&:to_i)
  end

  def call(stacks)
    @quantity.times do
      unless stacks[@source - 1].empty?
        item = stacks[@source - 1].pop
        stacks[@destination - 1].push(item)
      end
    end
    stacks
  end
end
