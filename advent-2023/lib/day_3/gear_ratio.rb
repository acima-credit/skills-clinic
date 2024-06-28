# frozen_string_literal: true

# Adds up the part numbers adjacent to a symbol
class GearRatio
  class Error < StandardError; end
  class FileError < Error; end

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @version = version
    @file_path = file_path
  end

  def call
    @version == 1 ? part_one : part_two
  end

  private

  def part_one
    File.readlines(@file_path).map do |line|
      line.chars
    end
  end



  def part_two

  end
end
