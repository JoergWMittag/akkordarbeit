# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# Copyright (c) 2009 Marc Rummel <mailto:Marc.Rummel+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

require 'yard'

taskdir = File.expand_path(File.dirname __FILE__).gsub(/(.*tasks).*?/, '\1')
basedir = File.expand_path File.join(taskdir, '..')
$LOAD_PATH.unshift basedir unless $LOAD_PATH.include? basedir

load 'akkordarbeit.gemspec'
include Akkordarbeit::Projectinfo

YARD::Rake::YardocTask.new
