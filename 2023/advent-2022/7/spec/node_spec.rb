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
    let(:new_node) { described_class.new(new_name) }
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
        expect(instance.children).to eq Set.new([new_node])
      end
    end
    context 'When we try to add a duplicate node' do
      it "Doesn't add a new node" do
        subject
        subject
        expect(instance.children.length).to eq(1)
      end
    end
  end
  describe '#size' do
    let(:size) { 10 }
    let(:kwargs) { { size: size } }
    let(:instance) { described_class.new(name, **kwargs) }

    subject { instance.size }

    context 'one-deep' do
      it 'Has the expected size' do
        expect(subject).to eq(10)
      end
    end
    context 'recursion' do
      let(:new_name) { 'New Node' }
      let(:new_size) { 15 }
      let(:new_kwargs) { { size: new_size } }
      let(:new_node) { described_class.new(new_name, **new_kwargs) }
      before do
        instance.add_node(new_node)
      end
      it 'Has the expected size' do
        expect(subject).to eq(25)
      end
    end
  end
end
