require_relative "spec_helper"
require_relative "../lib/validate_battlefield"

describe "validate_battlefield" do
  it "returns true for a valid field" do
    field = [[1, 0, 0, 0, 0, 1, 1, 0, 0, 0],
             [1, 0, 1, 0, 0, 0, 0, 0, 1, 0],
             [1, 0, 1, 0, 1, 1, 1, 0, 1, 0],
             [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
             [0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
             [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
    Test.expect(validate_battlefield(field), "Nope, something is wrong!")
  end

  it "returns false if there aren't enough ships" do
    field = [[1, 0, 0, 0, 0, 1, 1, 0, 0, 0],
             [1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
             [1, 0, 0, 0, 1, 1, 1, 0, 1, 0],
             [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
             [0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

    Test.assert_equals(validate_battlefield(field), false, "Not enough ships")
  end

  it "returns false if there are too many ships" do
    field = [[1, 0, 0, 0, 0, 1, 1, 0, 0, 0],
             [1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
             [1, 0, 0, 0, 1, 1, 1, 0, 1, 0],
             [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
             [0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
             [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
             [1, 0, 0, 1, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

    Test.assert_equals(validate_battlefield(field), false, "Too many ships")
  end
end
