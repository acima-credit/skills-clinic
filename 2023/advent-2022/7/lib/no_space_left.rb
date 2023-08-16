# frozen_string_literal: true

# Top level documentation!!!
class NoSpaceLeft
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

  def version_one
    File.open(@file_path, 'r') do |file|
      root = Node.new('root')
      while line = file.gets
        type = type_of_line(line)

      end
    end
  end
  def type_of_line(line)
    return "command" if line[0] == "$"
    return "directory" if line[0].match?(/[1-9]/)
    "file"
  end

  def version_two
    #
  end
end
