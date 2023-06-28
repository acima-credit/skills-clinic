# frozen_string_literal: true

require_relative '../lib/instruction'
require 'pathname'

RSpec.describe Instruction do
  describe '#call' do
    let(:stacks) { [['Z','N'], ['M','C','D'], ['P']] }

    context 'version 1' do
      let(:line) { 'move 1 from 2 to 1' }
      it 'works' do
        expect(Instruction.new(line).call(stacks)).to eq([['Z','N','D'], ['M','C'], ['P']])
      end
    end

    context 'version 2' do
      let(:line) { 'move 2 from 2 to 1' }
      it 'works' do
        expect(Instruction.new(line, 2).call(stacks)).to eq([['Z','N','C','D'], ['M'], ['P']])
      end
    end
  end
end
