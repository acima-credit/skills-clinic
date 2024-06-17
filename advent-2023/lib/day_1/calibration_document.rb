# frozen_string_literal: true

# Combines the first and last digits per line into one value.
class CalibrationDocument
  class Error < StandardError; end
  class FileError < Error; end

  MAP = { 'one' => '1',
          'two' => '2',
          'three' => '3',
          'four' => '4',
          'five' => '5',
          'six' => '6',
          'seven' => '7',
          'eight' => '8',
          'nine' => '9' }.freeze

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @version = version
    @file_path = file_path
  end

  def call
    @version == 1 ? calibrate : calibrate_two
  end

  private

  def calibrate
    File.readlines(@file_path).sum do |line|
      digits = line.scan(/\d/)
      (digits.first + digits.last).to_i
    end
  end

  # rubocop:disable Metrics/abcsize
  def calibrate_two
    File.readlines(@file_path).sum do |line|
      smallest = [line.length, 0]
      largest = [-1, line.length]
      MAP.each_key do |number|
        temp_small = line.length
        temp_small = line.index(number) unless line.index(number).nil?
        if temp_small < smallest[0]
          smallest[0] = temp_small
          smallest[1] = temp_small + number.length - 1
        end
      end

      line.gsub!(line[smallest[0]..smallest[1]], MAP[line[smallest[0]..smallest[1]]]) unless smallest[0] == line.length

      MAP.each_key do |number|
        temp_large = -1
        temp_large = line.rindex(number) unless line.rindex(number).nil?
        if temp_large > largest[0]
          largest[0] = temp_large
          largest[1] = temp_large + number.length - 1
        end
      end

      line.gsub!(line[largest[0]..largest[1]], MAP[line[largest[0]..largest[1]]].to_s) unless largest[0] == -1

      digits = line.scan(/\d/)
      (digits.first + digits.last).to_i
    end
  end
end
# rubocop:enable Metrics/abcsize
