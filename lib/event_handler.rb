require 'low_event'

module EventHandler
  def handle(event:)
    node = self.class == Class ? self.new(event:) : self
    node.handle(event:)
  end

  def render(event:)
    node = self.class == Class ? self.new(event:) : self
    response = Low::Events::ResponseFactory.response(body: node.render(event:))
    Low::Events::ResponseEvent.new(response:)
  end
end
