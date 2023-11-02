# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe DrawingTool::Commands::BucketFill do
  describe '#call' do
    let(:canvas) do
      height = 5
      width = 5

      Matrix[*height.times.map { Array.new(width, nil) }]
    end

    it 'fills the whole canvas' do
      described_class.new(canvas).call(0, 0)

      expect(canvas.to_a).to eq(
        [
          ['#', '#', '#', '#', '#'],
          ['#', '#', '#', '#', '#'],
          ['#', '#', '#', '#', '#'],
          ['#', '#', '#', '#', '#'],
          ['#', '#', '#', '#', '#']
        ]
      )
    end

    it 'fills only the half of canvas when there is an diagonal line' do
      DrawingTool::Commands::CreateLine.new(canvas).call(0, 0, 4, 4)

      described_class.new(canvas).call(0, 4)

      expect(canvas.to_a).to eq(
        [
          ['*', nil, nil, nil, nil],
          ['#', '*', nil, nil, nil],
          ['#', '#', '*', nil, nil],
          ['#', '#', '#', '*', nil],
          ['#', '#', '#', '#', '*']
        ]
      )
    end
  end
end
# rubocop:enable Metrics/BlockLength
