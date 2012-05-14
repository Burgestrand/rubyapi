task :compile do
  sh 'ruby extconf.rb'
  sh 'make'
end

task :console => :compile do
  exec 'irb -I. -rrubyapi'
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.libs    = ["."]
  t.pattern = "*_spec.rb"
  t.verbose = true
end
task :test => :compile

task :default => :test
