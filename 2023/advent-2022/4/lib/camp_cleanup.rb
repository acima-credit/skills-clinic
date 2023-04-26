# frozen_string_literal: true

class CampCleanup
  def initialize(file_path, version: 1)
    @file_path = file_path
    @version = version
  end

  def call
    process_file
  end

  private

  def process_file
    File.open(@file_path, "r")
      .each_line
      .lazy
      .filter(&method(:process_line))
      .size || 0
  end

  def process_line
    # empty
  end
end
