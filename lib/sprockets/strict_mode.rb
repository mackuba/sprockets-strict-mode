require 'sprockets/processor'

module Sprockets
  class StrictMode < Processor
    STRICT_MODE_HEADER = %("use strict";\n\n)

    def evaluate(context, locals)
      add_strict_mode?(context) ? (STRICT_MODE_HEADER + data) : data
    end


    private

    def add_strict_mode?(context)
      !empty_file? && !coffeescript?(context)
    end

    def empty_file?
      data.strip.empty?
    end

    def coffeescript?(context)
      context.pathname.basename.to_s =~ /\.coffee(\.|$)/
    end
  end
end
