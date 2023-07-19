# frozen_string_literal: true

# Top level Docs!!
class Node
  attr_reader :name, :children

  def initialize(name, size: 0)
    @children = []
    @name = name
    @size = size
  end

  def add_node(new_node)
    raise ArgumentError, 'New node passed in is not a node' unless new_node.is_a? Node

    @children << new_node
  end

  def size
    @size + @children.map(&:size).reduce(&:+).to_i
  end
end
