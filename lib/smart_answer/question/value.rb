module SmartAnswer
  module Question
    class Value < Base
      def initialize(name, options = {}, &block)
        @parse = options[:parse]
        super
      end

      def parse_input(raw_input)
        if Integer == @parse
          begin
            Integer(raw_input)
          rescue TypeError => e
            raise InvalidResponse, e.message
          end
        elsif :to_i == @parse
          raw_input.to_i
        elsif Float == @parse
          begin
            Float(raw_input)
          rescue TypeError => e
            raise InvalidResponse, e.message
          end
        elsif :to_f == @parse
          raw_input.to_f
        else
          super
        end
      end
    end
  end
end
