# frozen_string_literal: true

class CalibrationDocument
  #   File.open("../../data/", "r") do |f|
  class Error < StandardError; end
  class FileError < Error; end

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @file_path = file_path
  end

  def call
    calibrate
  end

  private

  def calibrate
    # sums = []
    # File.open(@file_path, 'r') do |f|
    #   f.each_line do |line|
    #     digits = line.scan(/\d/)
    #     sums << (digits.first + digits.last).to_i
    #   end
    # end
    # sums.sum


    File.open(@file_path, 'r') do |f|
      f.each_line do |line|
        digits = line.scan(/\d/)[-1...0].join.reverse.to_i # need to fix [-1...0]
        p digits
        sums << (digits.first + digits.last).to_i
      end
    end
  end
end
