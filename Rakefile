require File.dirname(__FILE__) + '/lib/tomdoc/version'

require 'rake/testtask'

def command?(command)
  system("type #{command} > /dev/null 2>&1")
end

#
# Manual
#

if command? :ronn
  desc "Build and display the manual."
  task :man => "man:build" do
    exec "man man/tomdoc.5"
  end

  desc "Build and display the manual in your browser."
  task "man:html" => "man:build" do
    sh "open man/tomdoc.5.html"
  end

  desc "Build the manual"
  task "man:build" do
    sh "ronn -br5 --organization=MOJOMBO --manual='TomDoc Manual' man/*.ronn"
  end
end


#
# Tests
#

task :default => :test

if command? :turn
  desc "Run tests with turn"
  task :turn do
    suffix = "-n #{ENV['TEST']}" if ENV['TEST']
    sh "turn -Ilib:. test/*.rb #{suffix}"
  end
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << '.'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end


#
# Development
#

desc "Drop to irb."
task :console do
  exec "irb -I lib -rtomdoc"
end


#
# Gems
#

desc "Build gem."
task :gem do
  sh "gem build tomdoc.gemspec"
end

task :push => [:gem] do
  file = Dir["*-#{TomDoc::VERSION}.gem"].first
  sh "gem push #{file}"
end

desc "tag version"
task :tag do
  sh "git tag v#{TomDoc::VERSION}"
  sh "git push origin master --tags"
  sh "git clean -fd"
end

desc "tag version and push gem to server"
task :release => [:push, :tag] do 
  puts "And away she goes!"
end

desc "Do nothing."
task :noop do
  puts "Done nothing."
end
