# frozen_string_literal: true

LowLoad.dirload(File.join(Dir.pwd, 'spec/fixtures'))

RSpec.describe 'RBX' do
  subject(:antlers_node) { described_class.new }

  describe '#render' do
    it 'renders RBX' do
      expect(antlers_node.render).to eq("<html><p>I'm a child</p></html>")
    end
  end
end
