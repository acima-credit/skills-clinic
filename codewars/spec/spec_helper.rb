require "minitest/spec"
require "minitest/autorun"

# simple testing
class Test
  Error = Class.new(StandardError)

  def self.assert_equals(actual, expected)
    return nil if expected == actual

    raise Error, "expected #{expected} got #{actual}"
  end
end
