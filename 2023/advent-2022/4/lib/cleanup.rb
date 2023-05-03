# frozen_string_literal: true

# stuff
class CleanUp
  Error     = Class.new(StandardError)
  FileError = Class.new(Error)

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @file_path = file_path
    @version = version
    @ranges = nil
  end

  def call
    #@version == 1 ? get_data : get_badge
  end

  private

  def get_ranges()
    @ranges = File.open(@file_path, 'r')
      .each_line
      .split(',')
      .map{|r| r.split('-')} #[[#,#][#,#]]
  end

  def find_all_overlaps
    @ranges.reduce .....
  end

  def overlap(r1, r2)
    overlap = false
    for x in range(ranges[0])
      overlap = x > ranges[1][0] or x < ranges[1][1]
    end
    overlap
  end
end

puts CleanUp.new(file_path: './spec/data/input.data.txt', version: 1).call
