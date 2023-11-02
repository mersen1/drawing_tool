# frozen_string_literal: true

module DrawingTool
  module DrawCommands
    class DrawLine
      def initialize(canvas, x0, y0, x1, y1) # rubocop:disable Naming/MethodParameterName
        @canvas = canvas
        @x0 = x0
        @y0 = y0
        @x1 = x1
        @y1 = y1
      end

      def call # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        delta_x = (x1 - x0).abs
        delta_y = (y1 - y0).abs

        return DrawingTool::DrawCommands::DrawLine.new(canvas, x1, y1, x0, y0).call if draw_from_bottom_to_top?

        error = 0
        delta_err = delta_y + 1
        y = y0
        dir_y = y1 - y0
        dir_y = 1 if dir_y.positive?
        dir_y = -1 if dir_y.negative?

        (x0..x1).each do |x|
          plot(x, y)
          error += delta_err
          if error >= delta_x
            y += dir_y
            error -= delta_x + 1
          end
        end
      end

      private

      attr_reader :canvas, :x0, :y0, :x1, :y1

      def plot(x, y) # rubocop:disable Naming/MethodParameterName
        canvas[y][x] = '*'
      end

      def draw_from_bottom_to_top?
        x1 - x0 < y1 - y0
      end
    end
  end
end
