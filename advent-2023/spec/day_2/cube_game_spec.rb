# frozen_string_literal: true

require_relative '../../lib/day_2/cube_game'
require 'pathname'

RSpec.describe CubeGame do
  let(:kwargs) { { file_path: file_path, version: version } }
  let(:file_path) { Pathname.new(__dir__).join('data', file_name) }
  let(:file_name) { 'part_1.txt' }
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
      it { is_expected.to eq(8) }
    end

  end
end
