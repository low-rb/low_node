require_relative '../../lib/low_node'

class ParentNode < LowNode
  def render
    <html><{ ChildNode }></html>
  end
end
