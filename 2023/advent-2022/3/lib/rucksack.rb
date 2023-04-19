# frozen_string_literal: true

class Rucksack
  Error     = Class.new(StandardError)
  FileError = Class.new(Error)

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @file_path = file_path
    @version = version
  end

  def call
    @version == 1 ? get_data : get_badge
  end

  private

  def get_data
    File.open(@file_path, "r")
      .each_line
      .lazy
      .map(&:chars) # e.g. [by rucksack[v,J,r,...],[j,q,H,...]]
      .map(&method(:split_line)) #[[[v,J,r,...],[...]],[[j,q,H,...],[...]]]
      .map{ |row| row.reduce(&:&) } # Returns an array of enumerators e.g [Enumerator::Lazy]
      .force # Returns an array of non-lazy enumerators e.g [["p"], ["L"], ["P"], ["v"], ["t"], ["s"]]
      .flatten # Returns a single array by reducing the dimensionality. e.g ["p", "L", "P", "v", "t", "s"]
      .map(&method(:get_priority)) # Returns the ASCII values per each letter e.g [16, 38, 42, 22, 20, 19]
      .sum # Adds up the values of the array
  end

  def get_priority(letter)
    letter.match(/[a-z]/) ? letter.ord - 96 : letter.ord - 38
  end

  def split_line(str)
    mid = str.size / 2
    [str[0, mid], str[mid..]]
  end

  def get_badge
    File.open(@file_path, "r")
      .each_line
      .each_slice(3)
      .lazy
      .map{ |sack| sack.map(&:strip).map(&:chars) }
      .map{ |row| row.reduce(&:&) }
      .force
      .flatten
      .map(&method(:get_priority))
      .sum
  end
end
