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

    def initialize(line)
      size_or_dir, name = line.split(' ')
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
    else Output.new(line)
    end
  end
end
