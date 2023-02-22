require_relative '../../lib/calorie_maximizer'

RSpec.describe CalorieMaximizer do
	describe ".new" do
		let(:args) { [] }
		let(:valid_file_path) { __FILE__ }

		subject { described_class.new(*args) }

		context "without args" do
			it("fails") { expect { subject }.to raise_error(ArgumentError) }
		end

		context "with args" do
      let(:file_path) {  }
			let(:args) { [file] }
		end
	end
end
