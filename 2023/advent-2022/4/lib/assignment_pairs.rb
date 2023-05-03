# frozen_string_literal: true

class AssignmentPairs
  def initialize(file_path:, version: 1)
    @file = File.open(file_path)
    @version = version
  end

  def call
    if @version == 1
      base_query.count { |ranges| ranges.first.cover?(ranges.last) || ranges.last.cover?(ranges.first) }
    else
      base_query.count { |ranges| ranges.first.any?(ranges.last) }
    end
  end

  private

  def base_query
    @file
      .each_line
      .lazy
      .map { |line| line.strip.split(",") }
      .map { |pairs| [Range.new(*pairs.first.split("-").map(&:to_i)), Range.new(*pairs.last.split("-").map(&:to_i))] }
  end
end