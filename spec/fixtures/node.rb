# frozen_string_literal: true

require_relative '../../lib/low_node'

module Ruby
  class Node < LowNode
    def render
      'node'
    end
  end
end
