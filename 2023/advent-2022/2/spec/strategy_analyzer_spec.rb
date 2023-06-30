# frozen_string_literal: true

require_relative '../lib/strategy_analyzer'
require 'pathname'

RSpec.describe StrategyAnalyzer do
  let(:kwargs) { { file_path: file_path, version: version } }
  let(:file_path) { Pathname.new(__dir__).join('data', 'strategy_guide.txt') }
  let(:version) { 1 }

  describe '#new' do
    subject { described_class.new(**kwargs) }

    context 'when file_path invalid' do
      let(:file_path) { 'badpath' }

      it 'raises a file error' do
        expect { subject }.to raise_error(described_class::FileError)
      end
    end

    context 'when file_path valid' do
      it "doesn't raise a file error" do
        expect { subject }.to_not raise_error
      end
    end
  end

  describe '#call' do
    subject { described_class.new(**kwargs).call }

    context 'with part 1 rules' do
      context 'with a sample file' do
        it { is_expected.to eq(15) }
      end

      context 'with a full size data set' do
        let(:file_path) { Pathname.new(__dir__).join('data', 'strategy_guide_full.txt') }

        it { is_expected.to eq(13_005) }
      end
    end

    context 'with part 2 rules' do
      let(:version) { 2 }

      context 'with a sample file' do
        it { is_expected.to eq(12) }
      end

      context 'with a full size data set' do
        let(:file_path) { Pathname.new(__dir__).join('data', 'strategy_guide_full.txt') }

        it { is_expected.to eq(11_373) }
      end
    end
  end
end
