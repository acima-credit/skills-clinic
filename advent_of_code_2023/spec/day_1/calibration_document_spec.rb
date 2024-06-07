# frozen_string_literal: true

require_relative '../../lib/day_1/calibration_document'
require 'pathname'

# rubocop:disable Metrics/BlockLength
RSpec.describe CalibrationDocument do
  let(:kwargs) { { file_path: file_path, version: version } }
  let(:file_path) { Pathname.new(__dir__).join('data', 'part_1.txt') }
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

    context 'Get the two-digit number' do
      # it 'is actually two digits' do

      # end

      it { is_expected.to eq(142) }
    end
  end
end
# rubocop:enable Metrics/BlockLength
