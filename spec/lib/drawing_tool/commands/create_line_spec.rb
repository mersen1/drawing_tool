# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe DrawingTool::Commands::CreateLine do
  describe '#call' do
    let(:canvas) do
      height = 5
      width = 5

      Matrix[*height.times.map { Array.new(width, nil) }]
    end

    it 'draws line from the top left to the right bottom corner' do
      described_class.new(canvas).call(0, 0, 4, 3)

      expect(canvas.to_a).to eq(
        [
          ['*', nil, nil, nil, nil],
          [nil, '*', '*', nil, nil],
          [nil, nil, nil, '*', nil],
          [nil, nil, nil, nil, '*'],
          [nil, nil, nil, nil, nil]
        ]
      )
    end

    it 'draws line from the top right to the left bottom corner' do
      described_class.new(canvas).call(0, 4, 4, 1)

      expect(canvas.to_a).to eq(
        [
          [nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, '*'],
          [nil, nil, nil, '*', nil],
          [nil, '*', '*', nil, nil],
          ['*', nil, nil, nil, nil]
        ]
      )
    end

    it 'draws line from the right bottom corner to the top left' do
      described_class.new(canvas).call(4, 3, 0, 0)

      expect(canvas.to_a).to eq(
        [
          ['*', nil, nil, nil, nil],
          [nil, '*', '*', nil, nil],
          [nil, nil, nil, '*', nil],
          [nil, nil, nil, nil, '*'],
          [nil, nil, nil, nil, nil]
        ]
      )
    end

    it 'draws line from the left bottom to the top right corner' do
      described_class.new(canvas).call(0, 4 ,4, 1)

      expect(canvas.to_a).to eq(
        [
          [nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, '*'],
          [nil, nil, nil, '*', nil],
          [nil, '*', '*', nil, nil],
          ['*', nil, nil, nil, nil]
        ]
      )
    end

    it 'draws straight horizontal line' do
      described_class.new(canvas).call(0, 0, 4, 0)

      expect(canvas.to_a).to eq(
        [
          ['*', '*', '*', '*', '*'],
          [nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil]
        ]
      )
    end

    it 'draws straight vertical line' do
      described_class.new(canvas).call(0, 0, 0, 4)

      expect(canvas.to_a).to eq(
        [
          ['*', nil, nil, nil, nil],
          ['*', nil, nil, nil, nil],
          ['*', nil, nil, nil, nil],
          ['*', nil, nil, nil, nil],
          ['*', nil, nil, nil, nil]
        ]
      )
    end
  end
end
# rubocop:enable Metrics/BlockLength
