require 'test/helper'

class ChimneySourceParserTest < TomDoc::Test
  def setup
    @parser = TomDoc::SourceParser.new
    @result = @parser.parse(fixture(:chimney))

    @chimney = @result[:GitHub][:Chimney]
  end

  test "finds instance methods" do
    assert_equal 35, @chimney.instance_methods.size
  end

  test "attaches TomDoc" do
    m = @chimney.instance_methods.detect { |m| m.name == :get_user_route }
    assert_equal [:user], m.tomdoc.args.map { |a| a.name }
  end

  test "finds class methods" do
    assert_equal 9, @chimney.class_methods.size
  end

  test "finds namespaces" do
    assert @result[:GitHub][:Math]
    assert_equal 2, @result.keys.size
    assert_equal 3, @result[:GitHub].keys.size
  end

  test "finds methods in a namespace" do
    assert_equal 1, @result[:GitHub].class_methods.size
  end

  test "finds multiple classes in one file" do
    assert_equal 1, @result[:GitHub][:Math].instance_methods.size
    assert_equal 1, @result[:GitHub][:Jobs].instance_methods.size
  end
end

class SourceParserTest < TomDoc::Test
  def setup
    @parser = TomDoc::SourceParser.new
  end

  test "finds single class in one file" do
    result = @parser.parse(fixture(:simple))

    assert result[:Simple]

    methods = result[:Simple].instance_methods
    assert_equal 1, methods.size
    assert_equal [:string], methods.map { |m| m.name }
  end

  test "finds single module in one file"
  test "finds module in a module"
  test "finds module in a class"
  test "finds class in a class"

  test "finds class in a module in a module" do
    result = @parser.parse(fixture(:multiplex))
    klass = result[:TomDoc][:Fixtures][:Multiplex]
    assert klass
    assert_equal 3, klass.instance_methods.size
  end
end
