# frozen_string_literal: true

class SupplyStacks
  Error     = Class.new(StandardError)
  FileError = Class.new(Error)

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)

    @file_path = file_path
    @version = version
  end

  def call
    @version == 1 ? version_1 : version_2
  end

  private

  def version_1
    #step 1: parse the file into arrays to represent the stacks
      #part 1: open the file
      #part 2: find the first line that has a digit
      #part 3: split the line into the sequences of digits
      #part 4: split sequences into integers
      #part 5: find the largest integer
    #step 2: parse the moves into instructions
    #step 3: excecute the instructions
    #step 4: return the final value from each stack
  end
end
