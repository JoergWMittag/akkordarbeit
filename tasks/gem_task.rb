# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# Copyright (c) 2009 Marc Rummel <mailto:Marc.Rummel+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

require 'rake'
require 'rake/gempackagetask'

taskdir = File.expand_path(File.dirname __FILE__).gsub(/(.*tasks).*?/, '\1')
$LOAD_PATH.unshift taskdir unless $LOAD_PATH.include? taskdir

basedir = File.expand_path File.join(taskdir, '..')
$LOAD_PATH.unshift basedir unless $LOAD_PATH.include? basedir

load Dir[File.expand_path File.join(basedir, '*.gemspec')].first

Rake::GemPackageTask.new Akkordarbeit::Projectinfo::GEMSPEC do |pkg|
  pkg.need_tar     = true
  pkg.need_tar_gz  = true
  pkg.need_tar_bz2 = true
  pkg.need_zip     = true
end
