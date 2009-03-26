# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# Copyright (c) 2009 Marc Rummel <mailto:Marc.Rummel+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

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
