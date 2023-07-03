# frozen_string_literal: true

# Camp Cleanup
class CleanUp
  Error     = Class.new(StandardError)
  FileError = Class.new(Error)

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @file_path = file_path
    @version = version
  end

  def call
    process_file
  end

  private

  def process_file
    File.open(@file_path, 'r')
        .each_line
        .lazy
        .filter(&method(:process_line))
        .force
        .size
  end

  def process_line(line)
    ranges = line.split(/,/)
                 .map { |string| string.split('-') }
                 .map { |pair| pair[0].to_i..pair[1].to_i }

    case @version
    when 1
      ranges[0].cover?(ranges[1]) || ranges[1].cover?(ranges[0])
    else
      ranges[0].begin <= ranges[1].end && ranges[0].end >= ranges[1].begin
    end
  end
end
