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
    File.foreach(@file_path).sum do |line|
      id, draws = parse_line(line)
      draws.all? { |draw| draw_valid?(draw) } ? id : 0
    end
  end

  private

  def parse_line(line)
    id = line.match(/Game (\d+)/)[1].to_i
    draws = line.scan(/\d+ \w+/).map { |draw| draw.split(' ') }
    [id, draws]
  end

  def draw_valid?(draw)
    num = draw[0].to_i
    color = draw[1].to_sym
    num <= MAX_CUBES[color]
  end
end
