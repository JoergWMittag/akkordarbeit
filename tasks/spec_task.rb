#!/usr/bin/env ruby
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

begin require 'rubygems'; rescue LoadError
else begin gem 'rake', '~> 0.8.13'; rescue Gem::LoadError; end end
require 'rake'

taskdir = File.expand_path(File.dirname __FILE__).gsub(/(.*tasks).*?/, '\1')
$LOAD_PATH.unshift taskdir unless $LOAD_PATH.include? taskdir

desc 'Run the Specs'
task :spec do
  FileList[File.join taskdir, '..', 'spec', '**', '*_suite.rb'].each { |specsuite| require specsuite }
end
