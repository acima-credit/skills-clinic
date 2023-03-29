# frozen_string_literal: true

class Rucksack

  Error     = Class.new(StandardError)
  FileError = Class.new(Error)

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @file_path = file_path
    @version =  version
  end

  def call
    get_data
  end

  private

  def get_data
    File.open(@file_path, "r")
      .each_line
      .lazy
      .map(&:chars) # e.g. [by rucksack[v,J,r,...],[j,q,H,...]]
      .map(&method(:split_line)) #[[[v,J,r,...],[...]],[[j,q,H,...],[...]]]
      .reduce(&:&)
  end

  def split_line(str)
    mid = str.size / 2
    [str[0, mid], str[mid..]]
  end
end