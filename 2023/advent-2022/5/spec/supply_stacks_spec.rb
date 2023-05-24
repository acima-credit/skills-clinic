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
end
