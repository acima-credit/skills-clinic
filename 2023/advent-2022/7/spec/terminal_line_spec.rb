# frozen_string_literal: true

require_relative '../lib/terminal_line'
require 'pathname'

RSpec.describe TerminalLine do
  describe '.parse' do
    subject { described_class.parse(line) }

    context 'when a command' do
      let(:line) { '$ cd /' }

      it { is_expected.to be_a(TerminalLine::Command) }
    end

    context 'when an output' do
      let(:line) { 'dir a' }

      it { is_expected.to be_a(TerminalLine::Output) }
    end
  end

  describe TerminalLine::Command do
    let(:line) { '$ cd /' }
    let(:instance) { described_class.new(line) }

    describe '#command?' do
      subject { instance.command? }
      it { is_expected.to eq(true) }
    end

    describe '#output?' do
      subject { instance.output? }
      it { is_expected.to eq(false) }
    end
  end

  describe TerminalLine::Output do
    let(:line) { 'dir a' }
    let(:instance) { described_class.new(line) }

    describe '#command?' do
      subject { instance.command? }

      it { is_expected.to eq(false) }
    end

    describe '#output?' do
      subject { instance.output? }

      it { is_expected.to eq(true) }
    end
  end
end
