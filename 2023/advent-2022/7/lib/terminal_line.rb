# frozen_string_literal: true

# terminal line
class TerminalLine
  # Command
  class Command
    attr_reader :command, :args

    def initialize(line)
      _, command, *args = line.split(' ')

      @command = command
      @args = args
    end

    def command?
      true
    end

    def output?
      false
    end
  end

  # Output
  class Output
    attr_reader :size_or_dir, :name

    def initialize(line, is_dir)
      size_or_dir, name = line.split(' ')
      @is_dir =  is_dir
      @size_or_dir = size_or_dir
      @name = name
    end

    def command?
      false
    end

    def output?
      true
    end
  end

  def self.parse(line)
    case line[0]
    when '$' then Command.new(line)
    # when nil then Output.new('')
    when 'd' then Output.new(line, true)
    else Output.new(line, false)
    end
  end
end
