require "minitest/spec"
require "minitest/autorun"

# simple testing
class Test
  Error = Class.new(StandardError)

  def self.assert_equals(actual, expected, message=nil)
    return nil if expected == actual

    message ||= "expected #{expected} got #{actual}"
    raise Error, message
  end

  def self.expect(value, message="")
    return nil if value

    raise Error, message
  end
end
