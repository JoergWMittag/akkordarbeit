#!/usr/bin/env ruby
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

begin require 'rubygems'; rescue LoadError
else begin gem 'cucumber', '~> 0.1.15'; rescue Gem::LoadError; end end
require 'cucumber/rake/task'

featuredir = File.expand_path(File.dirname __FILE__).gsub(/(.*features).*?/, '\1')
$LOAD_PATH.unshift featuredir unless $LOAD_PATH.include? featuredir

basedir = File.expand_path File.join(featuredir, '..')
$LOAD_PATH.unshift basedir unless $LOAD_PATH.include? basedir

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty"
end
