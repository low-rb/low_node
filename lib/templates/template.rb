# frozen_string_literal: true

module Low
  module Templates
    class Template
      attr_reader :template, :params, :namespace, :engine, :ast

      def initialize(template:, params:, namespace:, engine:)
        @template = template
        @params = params
        @namespace = namespace

        @engine = engine
        @ast = engine.ast(template)
      end
    end
  end
end
