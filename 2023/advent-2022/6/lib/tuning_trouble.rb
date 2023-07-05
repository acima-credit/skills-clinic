# frozen_string_literal: true

# Advent of Code Day 6: Tuning Trouble
class TuningTrouble
  MAXIMUM_FILE_SIZE = 1_000_000
  Error             = Class.new(StandardError)
  FileError         = Class.new(Error)

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)
    raise FileError, 'File is empty' if File.size(file_path).zero?
    raise FileError, 'File is too large' if File.size(file_path) > MAXIMUM_FILE_SIZE

    @file_path = file_path
    @version = version
  end

  def call
    @version == 1 ? version_one : version_two
  end

  private

  def version_one
    File.open(@file_path, 'r') do |file|
      line = file.gets

      char_arr = line.chars
    end
  end
end
