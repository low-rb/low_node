<a href="https://rubygems.org/gems/low_node" title="Install gem"><img src="https://badge.fury.io/rb/low_node.svg" alt="Gem version" height="18"></a>

# LowNode [UNRELEASED]

LowNodes are the flexible building blocks of your application. They can respond to a route request, or they can be called by another node. They can render a return value, or they can create an event. They are designed to be specific enough to observe events and return values, but generic enough to be split up to represent a complex application with its own patterns and structure. Nodes can render HTML/JSON directly from the Ruby class (via RBX, similar to JSX) and render other nodes into the output using Raindeer's special Antlers syntax; `<html><{ ChildNode }></html>`.

## RBX [UNRELEASED]

Instead of `.rb` use `.rbx` as your file extension. In the special `render()` method place HTML:

```ruby
def render
  <html></html>
end
```

## Antlers [UNRELEASED]

```ruby
def render
  <html><{ ChildNode }></html>
end
```
