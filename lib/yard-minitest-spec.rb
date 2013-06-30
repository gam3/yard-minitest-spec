
class YardMiniTestSpec
  VERSION = '0.1.2'
end

begin
  YARD::Templates::Engine.register_template_path File.dirname(__FILE__) + '/../templates'
  require File.join(File.dirname(__FILE__), 'yard-minitest-spec', 'handler') if RUBY19
rescue
end

