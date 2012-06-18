module TomDoc
  module Generators
    class HTML < Generator
      def highlight(text)
        pygments(text, '-l', 'ruby', '-f', 'html')
      end

      def write_scope_header(scope, prefix)
        #write "<h1>#{scope.name}</h1>"
      end

      def write_scope_footer(scope, prefix)
      end

      def write_class_methods(scope, prefix)
        out = ''
        out << super.join
        write out
      end

      def write_instance_methods(scope, prefix)
        out = ''+"\n"
        out << super.join
        out << ''+"\n"
        write out
      end

      def write_method(method, prefix = '')
        if method.args.any?
          args = '(' + method.args.join(', ') + ')'
        end
        out = ''+"\n"
        out << "## #{method.to_s}"+"\n"

        out << ''+"\n"
        out << method.tomdoc.tomdoc
        out << ''+"\n"
      end
    end
  end
end
