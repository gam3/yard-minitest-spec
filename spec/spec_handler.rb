
require 'minitest/spec'
require 'minitest/autorun'

# @!visibility private
class YARD
  # @!visibility private
  class Templates
  end
  class CodeObjects
    class Base
    end
  end
  class Handlers
    # @!visibility private
    class Ruby
      # @!visibility private
      class NamespaceMissingError
      end
      # @!visibility private
      class Node
        def source
          'text'
        end
        def parameters
        end
        def last
          Node.new
        end
      end
      # @!visibility private
      class Base
        # @!visibility private
        class Proxy
        end
        # @!visibility private
        def self.handles(*x)
        end
        # @!visibility private
        def self.method_call(x)
        end
        # @!visibility private
        def owner
          $owner
        end
        # @!visibility private
        def P(x)
          x
        end
        # @!visibility private
        def statement
          Node.new
        end
      end
    end
  end
end

#require 'yard-minitest-spec'
require 'yard-minitest-spec/handler'

$owner = nil

describe YardMiniTestSpecDescribeHandler do
  before do
    @yard = YardMiniTestSpecItHandler.new
  end
  describe '#process' do
    it 'must return a String' do
      @yard.process.must_be_instance_of NilClass
    end
  end
end

describe YardMiniTestSpecItHandler do
  before do
    @yard = YardMiniTestSpecItHandler.new
  end
  describe '#process' do
    it 'must return a String' do
      @yard.process.must_be_instance_of NilClass
    end
  end
end

class YardMiniTestSpecItHandler
  describe '#process' do
    it 'must return a Nil' do
      @yard = YardMiniTestSpecItHandler.new
      @yard.process.must_equal nil
    end
  end
end

class YardMiniTestSpecDescribeHandler
  describe '#process' do
    it 'must return a Nil' do
      @yard = YardMiniTestSpecItHandler.new
      @yard.process.must_equal nil
    end
  end
end
