# frozen_string_literal: true

require_relative 'drawing_tool/version'

require 'zeitwerk'

Zeitwerk::Loader.for_gem.tap do |loader|
  loader.enable_reloading
  loader.setup
end

module DrawingTool
  class Error < StandardError; end
end
