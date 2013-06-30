
require 'minitest/spec'
require 'minitest/autorun'

# @!visibility private
# @private
class YARD
  # @!visibility private
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
        def self.handles(x)
        end
        def self.method_call(x)
        end
        def owner
          $owner
        end
        def P(x)
          x
        end
        def statement
          Node.new
        end
      end
    end
  end
end

require 'yard-minitest-spec'
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

