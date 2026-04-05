<a href="https://rubygems.org/gems/low_node" title="Install gem"><img src="https://badge.fury.io/rb/low_node.svg" alt="Gem version" height="18"></a>

# LowNode

LowNodes are the flexible building blocks of your application. They can respond to a route request, or they can be called by another node. They can render a return value, or they can create an event. They are designed to be specific enough to observe events and return values, but generic enough to be split up to represent a complex application with its own patterns and structure. Nodes can render HTML/JSON directly from the Ruby class (via RBX, similar to JSX) and render other nodes into the output using Raindeer's special Antlers syntax; `<html><{ ChildNode }></html>`.

## RBX

Use `.rbx` as your file extension and now you can place HTML inside of `render()`:

```ruby
class MyClass
  def render
    <p>Hello</p>
  end
end
```

## Antlers

Antlers syntax can be embedded inside the `render` method of your RBX file:
```ruby
class MyClass
  def render
    <p><{ ChildNode }></p>
  end
end
```

ℹ️ For the full syntax guide see [Antlers](https://github.com/raindeer-rb/antlers).

## Parallelism and Immutability

Antlers and LowNode works together to convert props to immutable copies and run enabled sections of code in parallel.

```ruby
def render
  <{ parallelize: }>
    # For Loop executed at the same time as UserNode.
    <{ for: user in: @users }>
      <{ UserNode user=user }>
    <{ :for }>

    # PostsNode executed at the same time as For Loop.
    <{ PostsNode }>
  <{ :parallelize }>
end
```
