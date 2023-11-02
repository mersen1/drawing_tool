# frozen_string_literal: true

module DrawingTool
  module Commands
    class BucketFill
      DEFAULT_PLOT_SYMBOL = '#'
      private_constant :DEFAULT_PLOT_SYMBOL

      def initialize(canvas, plot_symbol: DEFAULT_PLOT_SYMBOL)
        @canvas = canvas
        @plot_symbol = plot_symbol
      end

      # Flood Fill (https://en.wikipedia.org/wiki/Flood_fill)
      def call(x, y) # rubocop:disable Naming/MethodParameterName, Metrics/AbcSize
        return if x.negative? || x >= canvas.row_size || y.negative? || y >= canvas.column_size

        return unless canvas[y, x].nil?

        canvas[y, x] = plot_symbol

        call(x + 1, y)
        call(x - 1, y)
        call(x, y + 1)
        call(x, y - 1)
      end

      private

      attr_reader :canvas, :plot_symbol
    end
  end
end
