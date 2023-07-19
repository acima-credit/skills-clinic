# frozen_string_literal: true

# Directory
class Directory
  attr_accessor name, parent, children

  def initialize(name, parent)
    @name = name
    @parent = parent
    @children = {}
  end

  def size
    sum = 0
    children.each do |child_name, child|
      s = child.size
      return nil if s.nil?

      sum += s
    end
    sum
  end

  def add_child(child)
    @children[child.name] = child
  end
end
