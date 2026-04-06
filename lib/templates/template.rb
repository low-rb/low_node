# frozen_string_literal: true

module Low
  module Templates
    class Template
      attr_reader :parser, :ast, :template, :namespace

      def initialize(parser:, ast:, template:, namespace:)
        @parser = parser
        @ast = ast
        @template = template # Not currently used, AST provides all.
        @namespace = namespace
      end
    end
  end
end
