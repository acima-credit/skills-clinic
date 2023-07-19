# frozen_string_literal: true

require_relative 'directory'

# Advent of Code Day 7: No Space Left
class NoSpaceLeft
  Error             = Class.new(StandardError)
  FileError         = Class.new(Error)

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @file_path = file_path
    @version = version
    @root_directory = Directory.new('/', nil)
    @current_directory = @root_directory
  end

  def call
    parse_file
  end

  private

  def parse_file
    File.open(@file_path, 'r') do |file|
      file.each_line do |line|
        # $ for commands
      end
    end
  end
end
