require_relative '../../lib/low_node'

class AntlersNode < LowNode
  def render
    <html><{ ChildNode }></html>
  end
end
