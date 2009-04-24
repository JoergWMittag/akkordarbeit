# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# Copyright (c) 2009 Marc Rummel <mailto:Marc.Rummel+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

require 'spec/rake/spectask'

taskdir = File.expand_path(File.dirname __FILE__).gsub(/(.*tasks).*?/, '\1')

Spec::Rake::SpecTask.new do |t|
  t.warning = true
  t.rcov = true
  t.rcov_dir = File.join 'coverage', 'spec'
  t.spec_opts = File.readlines(File.join taskdir, '..', 'spec', 'spec.opts')
end
