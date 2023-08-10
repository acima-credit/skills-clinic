# frozen_string_literal: true

# terminal line
class TerminalLine
  # Command
  class Command
    attr :command, :args

    def initialize(line)
      _, @command, @args = line.split(' ')
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
    attr :size_or_dir, :name

    def initialize(line)
      @size_or_dir, @name = line.split(' ')
    end

    def command?
      false
    end

    def output?
      true
    end

    def dir?
      @size_or_dir == 'dir'
    end

    def size
      if dir?
        0
      else
        @size_or_dir.to_i
      end
    end
  end

  def self.parse(line)
    case line[0]
    when '$' then Command.new(line)
    # when nil then Output.new('')
    else Output.new(line)
    end
  end
end
