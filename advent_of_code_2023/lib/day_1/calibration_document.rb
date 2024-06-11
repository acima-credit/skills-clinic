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
    @version == 1 ? calibrate : calibrate_2
  end

  private

  def calibrate
    File.readlines(@file_path).sum do |line|
      digits = line.scan(/\d/)
      (digits.first + digits.last).to_i
    end
  end

  # def calibrate_2
  #   File.readlines(@file_path).each do |line|
  #     curWord = ""
  #     line.chars.each do |x|
  #       if x.is_a? Integer
  #         curWord = ""
  #       else
  #         curWord += x
  #       end
  #       line = MAP.keys.select{ |substring| curWord.include?(substring) }.map{|x| line.sub!(x, MAP[x])}.join
  #       digits = line.scan(/\d/)
  #       p (digits.first + digits.last).to_i
  #     end
  #   end
  # end

  def calibrate_2
    File.readlines(@file_path).each do |line|
      smallest = [line.length, 0]
      largest = [-1, line.length]
      MAP.each_key do |number|
        temp_small = line.length
        temp_small = line.index(number) unless line.index(number).nil?
        smallest = temp_small, temp_small + number.length - 1 if temp_small < smallest[0]

        temp_large = 0
        temp_large = line.rindex(number) unless line.rindex(number).nil?
        largest = temp_large, temp_large + number.length - 1 if temp_large > largest[0]
      end

      # find which number is at the smallest and largest index

      # gsub the end (to prevent the indexes from getting messed up at the beginning)
      # p line[largest[0]..largest[1]]
      # p MAP[line[largest[0]..largest[1]]]
      line.gsub!(line[largest[0]..largest[1]], MAP[line[largest[0]..largest[1]]])
      p line
      # gsub the first
      # p line[smallest[0]..smallest[1]]
      # p MAP[line[smallest[0]..smallest[1]]]
      line.gsub!(line[smallest[0]..smallest[1]], MAP[line[smallest[0]..smallest[1]]])
      p line

      digits = line.scan(/\d/)
      p (digits.first + digits.last).to_i
    end
  end
end

# https://ruby-doc.org/3.2.2/String.html#method-i-index

# MAP.each_key do |number|
#   temp = line.gsub(number, MAP[number])
#   line = temp unless temp.nil?
# end

# line.gsub!(/\w\W*/, MAP)
# p "#{line} modified line------------"

# temp = ''
# str = ''
# line.chars.map.with_index do |char, i|
#   p char
#   temp = line[0..i]
#   p "#{temp} temp-----------"
#   if MAP.key?(temp) then str += MAP[temp] end
# end
# p str
