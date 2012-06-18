require 'test/helper'

class ConsoleGeneratorTest < TomDoc::Test
  def setup
    @text = TomDoc::Generators::Console.generate(fixture(:simple))
  end

  test "works" do
    assert_equal <<text, @text
--------------------------------------------------------------------------------
\e[1mSimple#string(text)\e[0m

Just a simple method.

\e[32mtext\e[0m - The \e[36mString\e[0m to return.

Returns a \e[36mString\e[0m.
text
  end
end
