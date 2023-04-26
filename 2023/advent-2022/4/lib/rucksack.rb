# frozen_string_literal: true

# stuff
class CleanUp
  Error     = Class.new(StandardError)
  FileError = Class.new(Error)

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @file_path = file_path
    @version = version
  end

  def call
    #@version == 1 ? get_data : get_badge
  end

  private

end

puts CleanUp.new(file_path: './spec/data/input.data.txt', version: 1).call
