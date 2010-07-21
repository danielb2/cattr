require 'helper'

class TestCattr < Test::Unit::TestCase
  should "set and get class attributes" do
    class Moo
      cattr_accessor :cow
    end
    Moo.cow = 'test'
    assert('test',Moo.cow)
  end

  should "create class setter" do
    class Moo
      cattr_writer :cow
      def self.get
        @@cow
      end
    end
    Moo.cow = 'test'
    assert('test',Moo.get)
  end

  should "create class reder" do
    class Moo
      cattr_reader :cow
      def self.get=(arg)
        @@cow = arg
      end
    end
    Moo.get = 'test'
    assert('test',Moo.cow)
  end
end
