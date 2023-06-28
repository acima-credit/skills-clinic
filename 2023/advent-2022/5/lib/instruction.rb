# frozen_string_literal: true

# Parse the moves into instructions
class Instruction
  def initialize(line, version = 1)
    @version = version
    @quantity = @source = @destination = 0
    parse_line(line)
  end

  def call(stacks)
    @version == 1 ? call_version_one(stacks) : call_version_two(stacks)
  end

  private

  def call_version_one(stacks)
    @quantity.times do
      item = stacks[@source - 1].pop
      stacks[@destination - 1].push(item)
    end
    stacks
  end

  def call_version_two(stacks)
    items = stacks[@source - 1].pop(@quantity)
    stacks[@destination - 1].push(*items)
    stacks
  end

  def parse_line(line)
    parts = line.split
    _, @quantity, _, @source, _, @destination = parts.map(&:to_i)
    nil
  end
end
