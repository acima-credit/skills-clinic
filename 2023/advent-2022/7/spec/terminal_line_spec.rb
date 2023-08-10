# frozen_string_literal: true

require_relative '../lib/terminal_line'

RSpec.describe TerminalLine do
  describe '.parse' do
    let(:first_command) { '$ cd /' }
    let(:second_command) { '$ ls' }
    let(:third_command) { '$ cd ..' }
    let(:first_output) { 'dir a' }
    let(:second_output) { '14848514 b.txt' }

    context 'when terminal line command is cd' do
      subject { described_class.parse(first_command) }

      it 'is command' do
        expect(subject.command?).to be_truthy
        expect(subject.command).to eq('cd')
        expect(subject.args).to eq('/')
      end
    end

    context 'when terminal line command is ls' do
      subject { described_class.parse(second_command) }

      it 'is ls command' do
        expect(subject.command?).to be_truthy
        expect(subject.command).to eq('ls')
        expect(subject.args).to be_nil
      end
    end

    context 'when terminal line command is cd ..' do
      subject { described_class.parse(third_command) }

      it 'is cd command' do
        expect(subject.command?).to be_truthy
        expect(subject.command).to eq('cd')
        expect(subject.args).to eq('..')
      end
    end

    # let(:first_output) { 'dir a' }
    context 'when first output' do
      subject { described_class.parse(first_output) }

      it 'is cd command' do
        expect(subject.output?).to be_truthy
        expect(subject.size_or_dir).to eq('dir')
        expect(subject.name).to eq('a')
        expect(subject.dir?).to be_truthy
        expect(subject.size).to eq(0)
      end
    end
  end
end
