# frozen_string_literal: true

require_relative "../lib/assignment_pairs.rb"
require 'pathname'

RSpec.describe AssignmentPairs do
  describe ".new" do
    subject { described_class.new(file_path: file) }

    context "with valid file" do
      let(:file) { Pathname.new(__dir__).join("data", "input.txt") }

      it "opens the file" do
        expect { subject }.not_to raise_error
      end
    end

    context "with an invalid file" do
      let(:file) { nil }

      it "raises an ArgumentError" do
        expect { subject }.to raise_error
      end
    end
  end

  describe "#call" do
    let(:file) { Pathname.new(__dir__).join("data", "input.txt") }

    subject { described_class.new(file_path: file, version: version).call }

    context "with part 1 rules" do
      let(:version) { 1 }
      it { is_expected.to eq 2 }
    end

    context "with part 2 rules" do
      let(:version) { 2 }
      it { is_expected.to eq 4 }
    end
  end
end
