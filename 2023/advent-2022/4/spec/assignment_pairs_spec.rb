# frozen_string_literal: true

require_relative "../lib/assignment_pairs.rb"
require 'pathname'

RSpec.describe AssignmentPairs do
  describe ".new" do
    subject { described_class.new(file) }

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
end
