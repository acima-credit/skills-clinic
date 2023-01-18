require_relative '../../lib/calorie_maximizer'

RSpec.describe CalorieMaximizer do
	describe ".new" do

		subject { described_class.new }

		context "without args" do
			it("fails") { expect { subject }.to raise_error(ArgumentError) }
		end
	end
end