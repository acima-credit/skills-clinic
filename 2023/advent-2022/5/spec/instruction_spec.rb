# frozen_string_literal: true

require_relative '../lib/instruction'
require 'pathname'

RSpec.describe Instruction do
  describe '#call' do
    let(:stacks) { [%w[Z N], %w[M C D], %w[P]] }

    context 'version 1' do
      let(:line) { 'move 1 from 2 to 1' }
      it 'works' do
        expect(Instruction.new(line).call(stacks)).to eq([%w[Z N D], %w[M C], %w[P]])
      end
    end

    context 'version 2' do
      let(:line) { 'move 2 from 2 to 1' }
      it 'works' do
        expect(Instruction.new(line, 2).call(stacks)).to eq([%w[Z N C D], %w[M], %w[P]])
      end
    end
  end
end
