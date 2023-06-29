# frozen_string_literal: true

require_relative '../lib/supply_stacks'
require 'pathname'

RSpec.describe SupplyStacks do
  let(:kwargs) { { file_path: file_path, version: version } }
  let(:file_path) { Pathname.new(__dir__).join('data', 'input.data.txt') }
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

    it { is_expected.to eq('CMZ') }

    context 'with full dataset' do
      let(:file_path) { Pathname.new(__dir__).join('data', 'full.input.data.txt') }

      it { is_expected.to eq('QNHWJVJZW') }
    end

    context 'version 2' do
      let(:version) { 2 }

      it { is_expected.to eq('MCD') }

      context 'with full dataset' do
        let(:file_path) { Pathname.new(__dir__).join('data', 'full.input.data.txt') }

        it { is_expected.to eq('BPCZJLFJW') }
      end
    end
  end
end
