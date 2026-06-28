require_relative '../../lib/low_node'

module RBX
  class ParentNode < LowNode
    def render
      <html><{ ChildNode }></html>
    end
  end
end
