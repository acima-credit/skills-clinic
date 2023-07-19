require_relative '../lib/node'

RSpec.describe Node do
  let(:name) { 'ThisDir' }
  let(:kwargs) { {} }

  describe '.new' do
    subject { described_class.new(name, **kwargs) }
    context 'When no size is passed' do
      it 'has a size of 0' do
        expect(subject.size).to eq 0
        expect(subject.name).to eq name
      end
    end

    context 'When size is passed' do
      let(:size) { 10 }
      let(:kwargs) { { size: size } }
      it 'has a size that matches the parameters' do
        expect(subject.size).to eq size
        expect(subject.name).to eq name
      end
    end
  end
  describe '#add_node' do
    let(:new_name) { 'New Node' }
    let(:new_node) { Node.new(new_name) }
    let(:instance) { described_class.new(name, **kwargs) }
    subject { instance.add_node(new_node) }

    context 'When we add a invalid node' do
      let(:new_node) { ' ' }
      it 'Throws an argument error' do
        expect { subject }.to raise_error ArgumentError
      end
    end
    context 'When we add a valid node' do
      it 'Adds a new node' do
        subject
        expect(instance.children).to eq [new_node]
      end
    end
  end
end
