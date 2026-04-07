# frozen_string_literal: true

require 'antlers'

LowLoad.dirload(File.join(Dir.pwd, 'spec/fixtures'))

RSpec.describe 'RBX/Antlers' do
  let(:event) { 'mock event' }

  describe '#render' do
    context 'when the parent node has a child node' do
      it 'renders child' do
        expect(ParentNode.render(event:).response.body.read).to eq("<html><p>I&#39;m a child</p></html>")
      end
    end
  end
end
