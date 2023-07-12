# frozen_string_literal: true

# Advent of Code Day 6: Tuning Trouble
class TuningTrouble
  MAXIMUM_FILE_SIZE = 1_000_000
  KERNEL_SIZE       = 4
  LARGE_KERNEL_SIZE = 14
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
    @version == 1 ? process(KERNEL_SIZE) : process(LARGE_KERNEL_SIZE)
  end

  private

  def process(kernel_size)
    File.open(@file_path, 'r') do |file|
      file.gets.chars.each_cons(kernel_size).with_index.find do |group|
        group.first.uniq.count == kernel_size
      end.last + kernel_size # First element after packet indicator
    end
  end
end
