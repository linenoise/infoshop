require 'nanoc3/tasks'
Dir['tasks/*.rake'].sort.each { |rakefile| load rakefile }

desc "Collect, thumbnail, and compile."
task :default => [ :collect, :thumbnail, :compile ]
