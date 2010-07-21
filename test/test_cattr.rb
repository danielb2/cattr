require 'helper'

class TestCattr < Test::Unit::TestCase
  should "set and get class attributes" do
    class Foo
      cattr_accessor :bob
    end
    Foo.bob = 'test'
    assert('test',Foo.bob)
  end
end
