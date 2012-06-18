module TomDoc
  module Fixtures
    class Multiplex
      # Duplicate some text an abitrary number of times.
      #
      # text  - The String to be duplicated.
      # count - The Integer number of times to duplicate the text.
      #
      # Examples
      #   multiplex('Tom', 4)
      #   # => 'TomTomTomTom'
      #
      #   multiplex('Bo', 2)
      #   # => 'BoBo'
      #
      #   multiplex('Chris', -1)
      #   # => nil
      #
      # Returns the duplicated String when the count is > 1.
      # Returns nil when the count is < 1.
      # Returns the atomic mass of the element as a Float. The value is in
      #   unified atomic mass units.
      def multiplex(text, count)
        text * count
      end

      # Duplicate some text an abitrary number of times.
      #
      # Returns the duplicated String.
      def multiplex2(text, count)
        text * count
      end

      # Duplicate some text an abitrary number of times.
      #
      # Examples
      #   multiplex('Tom', 4)
      #   # => 'TomTomTomTom'
      #
      #   multiplex('Bo', 2)
      #   # => 'BoBo'
      def multiplex3(text, count)
        text * count
      end
    end
  end
end
