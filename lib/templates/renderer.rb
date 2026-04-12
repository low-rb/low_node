# frozen_string_literal: true

require_relative 'template'

module Low
  module Templates
    module Renderer
      def render(event:)
        raise NotImplementedError
      end

      # When render() contains RBX/Antlers then LowLoad populates a template to render with instead.
      def render_template(event:, parent_binding: binding, props: {})
        template = self.class.template
        current_binding = binding
        
        # Pass in props from parent component as keyword arguments.
        template.params.each do |param|
          current_binding.local_variable_set(param, props[param]) if props[param]
        end

        template.engine.render(ast: template.ast, current_binding:, parent_binding:, namespace: template.namespace)
      end

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def template
          @template
        end

        def load_template(template:, params:, engine:, namespace:)
          @template = Template.new(template:, params:, engine:, namespace:)
        end

        # TODO: Handle situation where node is tested in a unit test and args come in here; expose them to the template.
        def render(event:)
          node = self.new(event:)

          # RBX/Antlers is rendered via template while valid Ruby is rendered as written.
          body = @template ? node.render_template(event:) : node.render(event:)

          # GOAL: Make return value configurable; ResponseEvent, Response, or body.
          response = Low::Factories::ResponseFactory.html(body:)
          Low::Events::ResponseEvent.new(response:)
        end

        def render_template(event:, parent_binding: nil)
          self.new(event:).render_template(event:, parent_binding:)
        end
      end
    end
  end
end
