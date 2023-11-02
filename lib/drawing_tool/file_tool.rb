# frozen_string_literal: true

module DrawingTool
  class FileTool
    class << self
      def save(file_name, canvas)
        File.open(file_name, 'w') do |file|
          canvas.row_size.times do |row_index|
            file.puts(canvas.row(row_index).to_a.join)
          end
        end
      end
    end
  end
end
