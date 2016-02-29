require 'no_equals'

module NoEquals
  module CLT::Evaluation
    class << self
      def perform(input)
        input.strip!
        case input
        when 'q'            then exit 0
        when '+'            then Add.execute      { fail! }
        when '-'            then Subtract.execute { fail! }
        when '*'            then Multiply.execute { fail! }
        when '/'            then Divide.execute   { fail! }
        when /^-?\d*.?\d+$/ then Push.execute(input.to_f)
        else fail!
        end
        GetResult.execute
      end

    private

      def fail!
        abort 'Error: Undefined behavior'
      end
    end
  end
end
