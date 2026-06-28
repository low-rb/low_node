require_relative '../../lib/low_node'

module Ruby
  class NodeWithEvent < LowNode
    def render(event:)
      event
    end
  end
end
