# frozen_string_literal: true

# Counts the number of cubes to know if the bag configuration is possible
class CubeGame
  class Error < StandardError; end
  class FileError < Error; end

  MAX_CUBES = {
    red: 12,
    green: 13,
    blue: 14
  }.freeze

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
    File.foreach(@file_path).sum do |line|
      id, draws = parse_line(line)
      draws.all? { |draw| draw_valid?(draw) } ? id : 0
    end
  end

  def parse_line(line)
    id = line.match(/Game (\d+)/)[1].to_i
    draws = line.scan(/\d+ \w+/).map { |draw| draw.split(' ') }
    [id, draws]
  end

  def get_num_color(draw)
    num = draw[0].to_i
    color = draw[1].to_sym
    [num, color]
  end

  def draw_valid?(draw)
    num, color = get_num_color(draw)
    num <= MAX_CUBES[color]
  end

  def part_two
    File.foreach(@file_path).sum do |line|
      _, draws = parse_line(line)
      line_minimum = {}
      line_minimum.default = 0

      draws.each do |draw|
        num, color = get_num_color(draw)
        line_minimum[color] = num if line_minimum[color] < num
      end
      line_minimum.values.inject(:*)
    end
  end
end
