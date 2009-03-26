# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# Copyright (c) 2009 Marc Rummel <mailto:Marc.Rummel+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

begin require 'rubygems'; rescue LoadError
else begin gem 'rake', '~> 0.8.13'; rescue Gem::LoadError; end end
require 'rake'

taskdir = File.expand_path(File.dirname __FILE__).gsub(/(.*tasks).*?/, '\1')
$LOAD_PATH.unshift taskdir unless $LOAD_PATH.include? taskdir

desc 'Run the Specs'
task :spec do
  FileList[File.join taskdir, '..', 'spec', '**', '*_suite.rb'].each { |specsuite| require specsuite }
end
