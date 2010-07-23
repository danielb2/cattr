require 'helper'

class TestCattr < Test::Unit::TestCase
  should "set and get class attributes" do
    class Moo
      cattr_accessor :cow
    end
    Moo.cow = 'test'
    assert_equal('test',Moo.cow)
  end

  should "create class setter" do
    class Moo1
      cattr_writer :cow
      def self.get
        @@cow
      end
    end
    Moo1.cow = 'test'
    assert_equal('test',Moo1.get)
  end

  should "set and reset attributes" do
    class Moo2
      cattr_accessor :cow
    end
    Moo2.cow = 'test'
    assert('test',Moo2.cow)
    Moo2.cow = 'test2'
    assert_equal('test2',Moo2.cow)
  end

  should "create class reder" do
    class Moo3
      cattr_reader :cow
      def self.get=(arg)
        @@cow = arg
      end
    end
    Moo3.get = 'test'
    assert_equal('test',Moo3.cow)
  end

  should "return nil if not defined" do
    class Foo
      cattr_reader :moo
    end
    assert_equal(nil,Foo.moo)
  end

  should "assign in class" do
    class Foo2
      cattr_reader :moo
      def self.init
        @@moo = 3
      end
    end
    Foo2.init
    assert_equal(3,Foo2.moo)
  end

  should "assign in class with class meth" do
    class Foo3
      cattr_accessor :moo
      def self.init
        self.moo = 3
      end
    end
    Foo3.init
    assert_equal(3,Foo3.moo)
  end
end
