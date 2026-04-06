# frozen_string_literal: true

require 'observers'
require 'low_type'
require 'low_event'
require 'low_loop' # TODO: Merge low loop's response factory into low event.

require_relative 'templates/renderer'

class LowNode
  extend Observers

  include LowType
  include Low::Types
  include Low::Templates::Renderer

  attr_reader :event

  def initialize(event:)
    @event = event
  end

  def handle(event:)
    raise NotImplementedError
  end

  def render(event:)
    raise NotImplementedError
  end

  class << self
    def handle(event:)
      self.new(event:).handle(event:)
    end

    def inherited(child)
      child.include LowType
    end
  end
end
