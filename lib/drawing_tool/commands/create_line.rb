# frozen_string_literal: true

# rubocop:disable Naming/MethodParameterName, Metrics/MethodLength, Metrics/AbcSize
module DrawingTool
  module Commands
    class CreateLine
      DEFAULT_PLOT_SYMBOL = '*'
      private_constant :DEFAULT_PLOT_SYMBOL

      # Bresenham's line algorithm (https://en.wikipedia.org/wiki/Bresenham's_line_algorithm)
      def initialize(canvas, plot_symbol: DEFAULT_PLOT_SYMBOL)
        @canvas = canvas
        @plot_symbol = plot_symbol
      end

      def call(x0, y0, x1, y1)
        return plot_line_low(x0, y0, x1, y1) if (y1 - y0).abs < (x1 - x0).abs

        plot_line_high(x0, y0, x1, y1)
      end

      private

      attr_reader :canvas, :plot_symbol

      def plot(x, y)
        canvas[y, x] = plot_symbol
      end

      def plot_line_low(x0, y0, x1, y1)
        return plot_line_low(x1, y1, x0, y0) if x0 > x1

        dx = x1 - x0
        dy = y1 - y0
        yi = 1

        if dy.negative?
          yi = -1
          dy = -dy
        end

        d = (2 * dy) - dx
        y = y0

        (x0..x1).each do |x|
          plot(x, y)
          if d.positive?
            y += yi
            d += (2 * (dy - dx))
          else
            d += (2 * dy)
          end
        end
      end

      def plot_line_high(x0, y0, x1, y1)
        return plot_line_high(x1, y1, x0, y0) if y0 > y1

        dx = x1 - x0
        dy = y1 - y0
        xi = 1

        if dx.negative?
          xi = -1
          dx = -dx
        end

        d = (2 * dx) - dy
        x = x0

        (y0..y1).each do |y|
          plot(x, y)
          if d.positive?
            x += xi
            d += (2 * (dx - dy))
          else
            d += (2 * dx)
          end
        end
      end
    end
  end
end
# rubocop:enable Naming/MethodParameterName, Metrics/MethodLength, Metrics/AbcSize
