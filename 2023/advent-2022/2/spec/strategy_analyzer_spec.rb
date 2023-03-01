# frozen_string_literal: true

require_relative '../lib/strategy_analyzer'
require 'pathname'

RSpec.describe StrategyAnalyzer do
  let(:kwargs) { { file_path: file_path } }
  let(:file_path) { Pathname.new(__dir__).join("data", "strategy_guide.txt") }

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

  describe "#call" do
    subject { described_class.new(**kwargs).call }

    it { is_expected.to eq(15) }
  end
end