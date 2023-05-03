# frozen_string_literal: true

require_relative '../lib/cleanup'
require 'pathname'

RSpec.describe CleanUp do
  let(:kwargs) { { file_path: file_path, version: version } }
  let(:file_path) { Pathname.new(__dir__).join("data", "input.data.txt") }
  let(:version) { 1 }

  describe "#new" do
    subject { described_class.new(**kwargs) }

    context "when file_path invalid" do
      let(:file_path) { "badpath" }

      it "raises a file error" do
        expect { subject }.to raise_error(described_class::FileError)
      end
    end

    context "when file_path valid" do
      it "doesn't raise a file error" do
        expect { subject }.to_not raise_error
      end
    end
  end

  # describe "#call" do
  #   subject { described_class.new(**kwargs).call }

  #   context "with part 1 rules" do
  #     it { is_expected.to eq 157}
  #   end

  #   context "with part 2 rules" do
  #     let(:version) { 2 }

  #     it { is_expected.to eq 70 }
  #   end
  # end

  describe "#overlap" do
    let(r1) {}
    let(r2) {}
    let(subject) { described_class.new(**kwargs).send(:overlap, r1, r2) }

    context "overlap is given ranges that overlap" do
      let(r1) { [ 1 , 3 ] }
      let(r2) { [2,4 ] }

      it "returns true" do
        expect(subject).to eq(true)
      end
    end

    context "overlap is given ranges that don't overlap" do
      let(r1) {[1,3]}
      let(r2) {[4,6]}

      it "returns false" do
        expect(subject).to eq(false)
      end
    end
  end
end
