require_relative '../lib/camp_cleanup'
require 'pathname'

RSpec.describe CampCleanup do
	let(:valid_file_path) { Pathname.new(__dir__).join("data", "camp_cleanup.txt") }
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
		let(:kwargs) { {} }
		subject { described_class.new(*args, **kwargs).call }

		context "when empty file" do
			let(:valid_file_path) { Pathname.new(__dir__).join("data", "camp_cleanup_empty.txt") }

			it { is_expected.to eq(0) }
		end

		context "when not empty file" do
			let(:valid_file_path) { Pathname.new(__dir__).join("data", "camp_cleanup.txt") }

			it { is_expected.to eq(2) }
		end
  end
end
