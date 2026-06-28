require_relative '../../lib/low_node'

module RBX
  class NodeWithEvent < LowNode
    def render(event:)
      <html>{event}</html>
    end
  end
end
