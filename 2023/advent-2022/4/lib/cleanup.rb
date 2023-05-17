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
    # @version == 1 ? get_data : get_badge
  end

  private

  def overlap(r1, r2)
    # [1,2] [3,4] should return false
    # [1,4] [2,3] should return true
    # [1, 3], [2, 4]
    # [1, 4], [2, 3]
    # [2, 3], [1, 4]

    if r2.first >= r1.first
      r2.last <= r1.last
    else
      r1.last <= r2.last
    end
  end

  def get_ranges
    @ranges = File.open(@file_path, 'r')
                  .each_line
                  .split(',')
                  .map { |r| r.split('-') } # [[#,#][#,#]]
  end

  def find_all_overlaps
    # @ranges.reduce .....
  end
end

# puts CleanUp.new(file_path: './spec/data/input.data.txt', version: 1).call
