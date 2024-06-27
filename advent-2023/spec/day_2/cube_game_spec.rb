# frozen_string_literal: true

require_relative '../../lib/day_2/cube_game'
require 'pathname'

# rubocop:disable Metrics/BlockLength
RSpec.describe CubeGame do
  let(:kwargs) { { file_path: file_path, version: version } }
  let(:file_path) { Pathname.new(__dir__).join('data', file_name) }
  let(:file_name) { 'example.txt' }
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
      it 'does not raise a file error' do
        expect { subject }.to_not raise_error
      end
    end
  end

  describe '#call' do
    subject { described_class.new(**kwargs).call }

    context 'when part 1' do
      context 'when example' do
        it { is_expected.to eq(8) }
      end
      context 'when actual input' do
        let(:file_name) { 'input.txt' }

        it { is_expected.to eq(2771) }
      end
    end

    context 'when part 2' do
      let(:version) { 2 }

      context 'when example' do
        it { is_expected.to eq(2286) }
      end
      context 'when actual input' do
        let(:file_name) { 'input.txt' }

        it { is_expected.to eq(70_924) }
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
