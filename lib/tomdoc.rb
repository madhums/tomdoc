require 'pp'

require 'ruby_parser'
require 'colored'

module TomDoc
  autoload :Open3,        'open3'

  autoload :CLI,          'tomdoc/cli'

  autoload :Scope,        'tomdoc/scope'
  autoload :Method,       'tomdoc/method'
  autoload :Arg,          'tomdoc/arg'
  autoload :TomDoc,       'tomdoc/tomdoc'

  autoload :SourceParser, 'tomdoc/source_parser'
  autoload :Generator,    'tomdoc/generator'

  autoload :VERSION,      'tomdoc/version'

  module Generators
    autoload :Console, 'tomdoc/generators/console'
    autoload :HTML,    'tomdoc/generators/html'
  end
end
