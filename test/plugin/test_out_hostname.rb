require 'helper'

class HostnameOutputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  CONFIG1 = %[
    host app01.hoge
  ]

  def create_driver(conf = CONFIG, tag='test')
    Fluent::Test::OutputTestDriver.new(Fluent::HostnameOutput, tag).configure(conf)
  end

  def test_emit1
    d = create_driver(CONFIG1)
    time = Time.now.to_i - 3
    d.run do
      d.emit({'foo' => 'bar', 'baz' => 'boo'}, time)
      d.emit({'foo' => 'bar', 'baz' => 'boo'}, time)
    end
    emits = d.emits
    assert_equal 2, emits.length
  end
end
