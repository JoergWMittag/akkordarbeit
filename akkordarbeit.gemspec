#!/usr/bin/env ruby
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+Akkordarbeit@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

filelist = %w[
  akkordarbeit.gemspec
  bin/akkordarbeit
  lib/akkordarbeit.rb
  lib/akkordarbeit/akkordarbeit.rb
  LICENSE.txt
  Rakefile.rb
  README.rst
  spec/and_spec.rb
  spec/b001e_suite.rb
  spec/if_spec.rb
  spec/LICENSE.txt
  spec/not_spec.rb
  spec/or_spec.rb
  spec/spec_helper.rb
  spec/unless_spec.rb
  tasks/gem_task.rb
  tasks/spec_task.rb
  tasks/_default_task.rb
]

speclist = filelist.grep /^spec/

$spec = Gem::Specification.new do |s|
  s.name = 'akkordarbeit'
  s.summary = 'Message-sending based re-implementation of the Boolean operators.'
  s.version = Gem::Version.new '0.0.0'
  s.author = 'Jörg W Mittag'
  s.email = 'JoergWMittag+Akkordarbeit@GoogleMail.Com'
  s.homepage = 'https://JoergWMittag.GitHub.Com/akkordarbeit/'
  s.rubyforge_project = 'Akkordarbeit'
  s.required_ruby_version = Gem::Requirement.new '~> 1.8.6'
  s.files = filelist
  s.test_files = speclist
  s.description = <<-'HERE'
Akkordarbeit is a message-sending based re-implementation of the
Boolean operators 'if', 'unless', 'and', 'or' and 'not' in
pure Ruby. Lazy Evaluation / Short-circuiting is achieved
through the use of blocks and lambda expressions.
  HERE
end
