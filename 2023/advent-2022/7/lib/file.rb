# frozen_string_literal: true

# File
class File
  attr_accessor name, size

  def initialize(name, size)
    @name = name
    @size = size
  end
end
