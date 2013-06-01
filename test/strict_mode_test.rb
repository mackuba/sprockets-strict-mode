require 'test_helper'
require 'sprockets/strict_mode'

class TestStrictMode < Test::Unit::TestCase
  def setup
    @processor = Sprockets::StrictMode.new
    @locals = {}
  end

  def run_test(path)
    @processor.evaluate(FakeContext.new(path), @locals)
  end

  def test_javascript
    @processor.data = %(window.app = {};)
    output = run_test 'app/assets/javascripts/base.js'

    assert_equal %("use strict";\n\nwindow.app = {};), output
  end

  def test_coffeescript
    @processor.data = %(window.app = {})
    output = run_test 'app/assets/javascripts/base.js.coffee'

    assert_equal %(window.app = {}), output
  end

  def test_javascript_erb
    @processor.data = %(window.app = <%= json %>;)
    output = run_test 'app/assets/javascripts/base.js.erb'

    assert_equal %("use strict";\n\nwindow.app = <%= json %>;), output
  end

  def test_coffeescript_erb
    @processor.data = %(window.app = <%= json %>)
    output = run_test 'app/assets/javascripts/base.js.coffee.erb'

    assert_equal %(window.app = <%= json %>), output
  end

  def test_empty_js
    @processor.data = %(\n\n\n\n)
    output = run_test 'app/assets/javascripts/base.js'

    assert_equal %(\n\n\n\n), output
  end
end
