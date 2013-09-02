
require 'minitest/mock'
require 'minitest/spec'
require 'minitest/autorun'

# @!visibility private
class YARD
  # @!visibility private
  class Registry
    def self.resolve(namespace, name)
      mock = MiniTest::Mock.new
      mock.expect(:[], mock, [nil])
      mock.expect(:<<, mock, [nil])
      mock
    end
  end
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
        def namespace
          'mtsdh'
        end
        # @!visibility private
        def P(x)
          x
        end
        # @!visibility private
        def statement
          mock = MiniTest::Mock.new
          mock.expect(:last, mock, [])
          mock.expect(:source, mock, [])
          mock.expect(:chomp, mock, [])
          mock.expect(:size, mock, [])
          mock.expect(:>, mock, [nil])
          mock.expect(:parameters, mock, [])
          mock.expect(:first, mock, [])
          mock.expect(:jump, mock, [nil])
          mock.expect(:file, mock, [])
          mock.expect(:line, mock, [])
        end
      end
    end
  end
end

#require 'yard-minitest-spec'
require 'yard-minitest-spec/handler'

$owner = {}

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

$owner = { :mtsdh => [ 'A', 'B', 'C', '#d' ] }

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
