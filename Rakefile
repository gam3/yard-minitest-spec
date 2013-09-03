require 'rake/testtask'

begin
  require 'yard'
rescue LoadError => x
  YARD = nil
end

Rake::TestTask.new do |t|
  t.libs << "./spec"
  t.test_files = FileList['spec/spec_*.rb']
end

YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb', 'bin/*', 'spec/spec_*.rb' ]   # optional
  t.options = [ '--plugin', 'minitest-spec' ] # optional
end if YARD

task :spec => :test

desc "Builds the gem"
task :gem do
  Gem::Builder.new(eval(File.read('yard-minitest-spec.gemspec'))).build
end
