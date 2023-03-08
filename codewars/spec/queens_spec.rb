require_relative "spec_helper"
require_relative "../lib/queens"

describe "queens" do
  it "Sample Tests" do
    Test.assert_equals( queens(  0 ),     0 )
    Test.assert_equals( queens(  0 ),     0 )
    Test.assert_equals( queens(  1 ),     0 )
    Test.assert_equals( queens(  2 ),     0 )
    Test.assert_equals( queens(  3 ),     2 )
    Test.assert_equals( queens(  4 ),     6 )
    Test.assert_equals( queens(  5 ),    12 )
    Test.assert_equals( queens(  6 ),    20 )
    Test.assert_equals( queens( 20 ),   342 )
    Test.assert_equals( queens( 33 ),   992 )
    Test.assert_equals( queens( 50 ),  2352 )
  end
end
