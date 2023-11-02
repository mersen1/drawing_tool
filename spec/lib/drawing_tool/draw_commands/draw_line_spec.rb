# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe DrawingTool::DrawCommands::DrawLine do
  describe '#call' do
    let(:canvas) do
      height = 5
      width = 5

      canvas = []
      height.times { canvas.push(Array.new(width, nil)) }
      canvas
    end

    it 'draws line from the top left to the right bottom corner' do
      described_class.new(canvas, 0, 0, 4, 3).call

      expect(canvas).to eq(
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
      described_class.new(canvas, 0, 4, 4, 1).call

      expect(canvas).to eq(
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
      described_class.new(canvas, 4, 3, 0, 0).call

      expect(canvas).to eq(
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
      described_class.new(canvas, 0, 4 ,4, 1).call

      expect(canvas).to eq(
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
      described_class.new(canvas, 0, 0, 4, 0).call

      expect(canvas).to eq(
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
      described_class.new(canvas, 0, 0, 0, 4).call

      expect(canvas).to eq(
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
