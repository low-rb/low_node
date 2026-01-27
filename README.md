<a href="https://rubygems.org/gems/low_node" title="Install gem"><img src="https://badge.fury.io/rb/low_node.svg" alt="Gem version" height="18"></a>

# LowNode

LowNodes are the flexible building blocks of your application. They can respond to a route request, or they can be called by another node. They can render a return value, or they can create an event. They are designed to be specific enough to observe events and return values, but generic enough to be split up to represent a complex application with its own patterns and structure. Nodes can render HTML/JSON directly from the Ruby class (via RBX, similar to JSX) and render other nodes into the output using Raindeer's special Antlers syntax; `<html><{ ChildNode }></html>`.

## RBX [UNRELEASED]

Use `.rbx` as your file extension and now you can place HTML inside of `render()`:

```ruby
def render
  <html>Content</html>
end
```

Antlers expressions are also now accepted:

```ruby
def render
  <html><{ ChildNode }></html>
end
```

## Antlers

### Props

```ruby
def render
  <html><{ UserNode user=@user }></html>
end
```

### Slots

```ruby
def render
  <html>
    <{ LayoutNode: username=@user.username }>
      <{ UserNode user=@user }>
    <{ :LayoutNode }>
  </html>
end
```
