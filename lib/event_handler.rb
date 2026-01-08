require 'low_event'

module EventHandler
  def handle(event:)
    node = self.new(event:)
    node.handle(event:)
  end

  def render(event:)
    node = self.new(event:)
    response = Low::Events::ResponseFactory.response(body: node.render(event:))
    Low::Events::ResponseEvent.new(response:)
  end
end
