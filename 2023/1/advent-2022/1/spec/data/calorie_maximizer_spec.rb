require_relative '../../lib/calorie_maximizer'

RSpec.describe CalorieMaximizer do
	describe ".new" do
		let(:args) { [] }

		subject { described_class.new(*args) }

		context "without args" do
			it("fails") { expect { subject }.to raise_error(ArgumentError) }
		end

		context "with args" do
      let(:file) {  }
			let(:args) { [file] }
		end
	end
end
