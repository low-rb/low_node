require 'low_event'
require 'low_loop' # TODO: Merge low loop's response factory into low event.

module EventHandler
  def handle(event:)
    node = self.class == Class ? self.new(event:) : self
    node.handle(event:)
  end

  def render(event:)
    node = self.class == Class ? self.new(event:) : self
    response = Low::Factories::ResponseFactory.html(body: node.render(event:))
    Low::Events::ResponseEvent.new(response:)
  end
end
