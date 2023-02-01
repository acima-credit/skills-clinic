require_relative '../lib/calorie_maximizer'
require 'pathname'

RSpec.describe CalorieMaximizer do
	let(:valid_file_path) { Pathname.new(__dir__).join("data", "calories.txt") }
	let(:file) {  valid_file_path }
	let(:args) { [file] }

	describe ".new" do
		subject { described_class.new(*args) }

		context "without args" do
			let(:args) { [] }
			it("fails") { expect { subject }.to raise_error(ArgumentError) }
		end

		context "with args" do
			it "succeeds" do
				subject
			end
		end
	end

	describe "#call" do
		subject { described_class.new(*args).call }

		it { is_expected.to eq(24000) }
	end
end
