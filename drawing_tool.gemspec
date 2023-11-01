# frozen_string_literal: true

require_relative 'lib/drawing_tool/version'

Gem::Specification.new do |spec|
  spec.name = 'drawing_tool'
  spec.version = DrawingTool::VERSION
  spec.authors = ['Sergey Kucherov']
  spec.email = ['sergey.kucherov94@gmail.com']

  spec.summary = 'Write a short summary, because RubyGems requires one.'
  spec.description = 'Write a longer description or delete this line.'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.add_dependency 'zeitwerk', '~>2.6'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
