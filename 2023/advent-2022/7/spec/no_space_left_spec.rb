require_relative '../lib/no_space_left'
require 'pathname'

RSpec.describe NoSpaceLeft do
  let(:kwargs) { { file_path: file_path, version: version } }
  let(:file_path) { Pathname.new(__dir__).join('data', 'data.txt') }
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

      context 'with an empty file' do
        let(:file_path) { Pathname.new(__dir__).join('data', 'emptyFile.txt') }
        it 'should raise a file error' do
          expect { subject }.to raise_error(described_class::FileError)
        end
      end

      context 'with a large file' do
        before do
          allow(File).to receive(:size).and_return 1_000_001
        end

        it 'should raise a file error' do
          expect { subject }.to raise_error(described_class::FileError)
        end
      end
    end
  end
end
