require_relative '../../lib/low_node'

class ChildNode < LowNode
  def render
    <p>{"I'm a child"}</p>
  end
end
