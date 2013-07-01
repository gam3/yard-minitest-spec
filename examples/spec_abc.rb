# encoding: utf-8

require 'minitest/spec'
require 'minitest/autorun'

module A
  module B
    class C
      def itest
        'test instance test'
      end
     def self.ctest
        'test class test'
      end
      class D
        class E
          def self.test
            'test e'
          end
        end
        def test
          'test d'
        end
      end
    end
  end
end

module A::B
  describe 'C#itest' do
    it 'has a new method' do
      C.new.ctest.must_be_instance_of String
    end
  end
  describe 'X#bob' do
    it 'has a new method' do
      A::B::C.ctest.must_be_instance_of String
    end
  end
  describe 'X#bob' do
    it 'new' do
      A::B::C.ctest.must_be_instance_of String
    end
  end
end

  describe 'X#bob' do
    it 'old' do
      A::B::C.ctest.must_be_instance_of String
    end
  end

describe 'X#bob' do
  it 'has a new method' do
    A::B::C.ctest.must_be_instance_of String
  end
end

describe A::B::C do
  describe ':ctest' do
    it 'has a new method' do
      A::B::C.ctest.must_be_instance_of String
    end
  end
  describe '#itest' do
    it 'has a new method' do
      A::B::C.new.itest.must_be_instance_of String
    end
  end
  describe ':ctest' do
    it 'has a new method' do
      A::B::C.ctest.must_be_instance_of String
      A::B::C.ctest.must_equal 'test class test'
    end
    it 'has a old method' do
      A::B::C.ctest.must_be_instance_of String
      A::B::C.ctest.must_equal 'test class test'
    end
  end
end

describe A do
  describe B do
    describe C do
      describe ':ctest' do
        it 'has a new method' do
          A::B::C.ctest.must_be_instance_of String
        end
      end
      describe '#itest' do
        it 'has a new method' do
          A::B::C.new.itest.must_be_instance_of String
        end
      end
      describe ':ctest' do
        it 'has a new method' do
          A::B::C.ctest.must_be_instance_of String
          A::B::C.ctest.must_equal 'test class test'
        end
        it 'has a old method' do
          A::B::C.ctest.must_be_instance_of String
          A::B::C.ctest.must_equal 'test class test'
        end
      end
    end
  end
end

