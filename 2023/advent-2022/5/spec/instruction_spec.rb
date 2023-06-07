# frozen_string_literal: true

require_relative '../lib/instruction'
require 'pathname'

RSpec.describe Instruction do
  let(:kwargs) { :line }
  let(:line) { 'move 1 from 2 to 1' }

  # describe '#parse_line' do

  # end

  describe '#call' do
    let(:stacks) { [['Z','N'], ['M','C','D'], ['P']] }

    it 'works' do
      expect(Instruction.new(line).call(stacks)).to eq([['Z','N','D'], ['M','C'], ['P']])
    end
  end
end
