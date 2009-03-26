# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# Copyright (c) 2009 Marc Rummel <mailto:Marc.Rummel+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

require 'rake'

taskdir = File.expand_path File.join(File.dirname(__FILE__), 'tasks')
$LOAD_PATH.unshift taskdir unless $LOAD_PATH.include? taskdir

FileList[File.join taskdir, '**', '*_task.rb'].each do |task| load task end
