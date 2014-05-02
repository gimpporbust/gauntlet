module Gauntlet
  module Problems
    class PostfixCalculator
      attr_reader :expression, :index

      # This one's not math, I swear!

      # Your job is to create a calculator which evaluates expressions
      # in postfix notation, sometimes called reverse Polish notation.

      # For example, the expression
      # 
      #     5 1 2 + 4 * + 3 -
      #
      # is equivalent to
      #
      #     5 + ((1 + 2) * 4) - 3
      #
      # and evaluates to 14.

      # Note for simplicity's sake you can assume there are always spaces
      # between numbers and operations.
      # e.g. `1 3 +` is valid but `1 3+` is not.

      # Source: Codewars

      def self.calc(expression)
        @expression = expression.split(" ")
        do_it(@expression, 0)
      end

      def self.do_it(expression, index)
        set = expression[index..index+2]
        if all_numbers(set)
          # move on
          index += 1
        else
          result = calculate(set)
          expression[index] = result
          index += 1
        end
        do_it(expression, index)
      end

      def self.all_numbers(set)
        set.all? { |i| i.to_i != 0 }
      end

      def self.calculate(set)
        case set[2]
        when "+"
          set[0].to_i + set[1].to_i
        when "-"
          set[0].to_i - set[1].to_i
        when "*"
          set[0].to_i * set[1].to_i
        when "/"
          set[0].to_i / set[1].to_i
        else throw "NOPE"
        end
      end

    end
  end
end
