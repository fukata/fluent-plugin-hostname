require 'helper'

class HostnameOutputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  CONFIG1 = %[
    host app01.hoge
  ]
  CONFIG2 = %[
    key_name server
    host app02.hoge
  ]
  CONFIG3 = %[
    host app03.hoge
  ]

  def create_driver(conf = CONFIG, tag='test')
    Fluent::Test::OutputTestDriver.new(Fluent::HostnameOutput, tag).configure(conf)
  end

  def test_emit1
    d = create_driver(CONFIG1)
    time = Time.now.to_i
    d.run do
      d.emit({'foo' => 'bar', 'baz' => 'boo'}, time)
      d.emit({'foo' => 'bar', 'baz' => 'boo'}, time)
    end
    emits = d.emits
    assert_equal 2, emits.length

    assert_equal 'test', emits[0][0]
    assert_equal time, emits[0][1]
    assert_equal ['foo','baz','host'], emits[0][2].keys
    assert_equal 'app01.hoge', emits[0][2]['host']


    assert_equal 'test', emits[0][0]
    assert_equal time, emits[0][1]
    assert_equal ['foo','baz','host'], emits[0][2].keys
    assert_equal 'app01.hoge', emits[0][2]['host']
  end

  def test_emit2
    d = create_driver(CONFIG2)
    time = Time.now.to_i
    d.run do
      d.emit({'foo' => 'bar', 'baz' => 'boo'}, time)
      d.emit({'foo' => 'bar', 'baz' => 'boo'}, time)
    end
    emits = d.emits
    assert_equal 2, emits.length

    assert_equal 'test', emits[0][0]
    assert_equal time, emits[0][1]
    assert_equal ['foo','baz','server'], emits[0][2].keys
    assert_equal 'app02.hoge', emits[0][2]['server']


    assert_equal 'test', emits[0][0]
    assert_equal time, emits[0][1]
    assert_equal ['foo','baz','server'], emits[0][2].keys
    assert_equal 'app02.hoge', emits[0][2]['server']
  end

  def test_emit3
    d = create_driver(CONFIG3)
    time = Time.now.to_i
    d.run do
      d.emit({'foo' => 'bar', 'baz' => 'boo', 'host' => 'hoge'}, time)
      d.emit({'foo' => 'bar', 'baz' => 'boo', 'host' => 'hoge'}, time)
    end
    emits = d.emits
    assert_equal 2, emits.length

    assert_equal 'test', emits[0][0]
    assert_equal time, emits[0][1]
    assert_equal ['foo','baz','host'], emits[0][2].keys
    assert_equal 'app03.hoge', emits[0][2]['host']


    assert_equal 'test', emits[0][0]
    assert_equal time, emits[0][1]
    assert_equal ['foo','baz','host'], emits[0][2].keys
    assert_equal 'app03.hoge', emits[0][2]['host']
  end
end
