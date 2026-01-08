# frozen_string_literal: true

require 'observers'
require 'low_type'

require_relative 'event_handler'

class LowNode
  extend Observers
  extend EventHandler
  include EventHandler
  include LowType

  def initialize(event:)
  end

  def self.inherited(child)
    child.include LowType
  end
end
