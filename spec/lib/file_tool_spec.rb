# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DrawingTool::FileTool do
  describe '.save' do
    let(:canvas) do
      height = 20
      width = 20

      Matrix[*height.times.map { Array.new(width, nil) }]
    end

    it 'saves canvas to a file' do
      file_name = 'output.txt'

      DrawingTool::Commands::CreateLine.new(canvas, plot_symbol: '|').call(0, 0, 18, 18)
      DrawingTool::Commands::CreateLine.new(canvas, plot_symbol: '|').call(0, 19, 19, 19)
      DrawingTool::Commands::BucketFill.new(canvas, plot_symbol: 'O').call(0, 1)
      DrawingTool::Commands::BucketFill.new(canvas, plot_symbol: '@').call(1, 0)

      described_class.save(file_name, canvas)
    end
  end
end
