# frozen_string_literal: true

require_relative 'template'

module Low
  module Templates
    module Renderer
      # When `render()` contains RBX/Antlers then LowLoad populates a Template which we use to render instead.
      def render_template(event:)
        template = self.class.template
        template.parser.render(template.ast, caller_binding: binding, namespace: template.namespace)
      end

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def template
          @template
        end

        def add_template(parser:, ast:, template:, namespace:)
          @template = Template.new(parser:, ast:, template:, namespace:)
        end

        def render(event:)
          node = self.new(event:)

          # Valid Ruby is rendered as written while RBX/Antlers is rendered via template.
          body = @template ? node.render_template(event:) : node.render(event:)

          # GOAL: Make return value configurable; ResponseEvent, Response, or body.
          response = Low::Factories::ResponseFactory.html(body:)
          Low::Events::ResponseEvent.new(response:)
        end
      end
    end
  end
end
