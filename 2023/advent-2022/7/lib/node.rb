# frozen_string_literal: true

require 'set'
# Top level Docs!!
class Node
  attr_reader :name, :children

  def initialize(name, size: 0)
    @children = Set.new
    @name = name
    @size = size
  end

  def hash
    name.hash
  end

  def eql?(other)
    return false unless other.is_a? Node

    name == other.name
  end
  alias == eql?

  def add_node(new_node)
    raise ArgumentError, 'New node passed in is not a node' unless new_node.is_a? Node
    raise ArgumentError, 'Node cannot be a child of itself' if new_node == self

    @children << new_node
  end

  def size
    @size + @children.map(&:size).reduce(&:+).to_i
  end
end
