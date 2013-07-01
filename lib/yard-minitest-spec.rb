
begin
YARD::Templates::Engine.register_template_path File.dirname(__FILE__) + '/../templates'
require File.join(File.dirname(__FILE__), 'yard-minitest-spec', 'handler.rb') if RUBY19
rescue => x
  puts x
end
