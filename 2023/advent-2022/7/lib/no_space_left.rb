# frozen_string_literal: true

# Top level documentation!!!
class NoSpaceLeft
  MAXIMUM_FILE_SIZE = 1_000_000
  Error             = Class.new(StandardError)
  FileError         = Class.new(Error)

  def initialize(file_path:, version: 1)
    raise FileError unless File.exist?(file_path)
    raise FileError, 'File is empty' if File.size(file_path).zero?
    raise FileError, 'File is too large' if File.size(file_path) > MAXIMUM_FILE_SIZE

    @file_path = file_path
    @version = version
  end

  def call
    @version == 1 ? version_one : version_two
  end

  def version_one
    visited = []
    File.open(@file_path, 'r') do |file|
      root = Node.new('/')
      current_dir = root
      visited.push(current_dir)
      while line = file.gets
        current_item = TerminalLine.parse(line)
        next if current_item.command? && !cd?(current_item)

        if current_item.command?
          if current_item.args == '..'
            current_dir = visited.pop
          elsif current_item.args == '/'
            visited.classe
            current_dir = root
          else
            index_node = Node.new(current_item.args.first)
            current_dir = current_dir.children.select { |node| node == index_node }
          end
        else
          current_dir.add_node(Node.new(current_item.name, current_item.size))
        end
      end
    end
  end

  def cd?(terminal_item)
    terminal_item.command == 'cd'
  end


  def version_two
    #
  end
end
