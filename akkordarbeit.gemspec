# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# Copyright (c) 2009 Marc Rummel <mailto:Marc.Rummel+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

module Akkordarbeit
  module Projectinfo
    NAME     = 'Akkordarbeit'
    VERSION  = '0.0.5'
    SUMMARY  = 'Formats ChordPro leadsheets as HTML or plaintext'
    AUTHORS  = ['Jörg W Mittag', 'Marc Rummel']
    EMAIL    = 'JoergWMittag+Akkordarbeit@GoogleMail.Com'
    HOMEPAGE = 'http://JoergWMittag.GitHub.Com/akkordarbeit/'
    DESCRIPTION = <<-'HERE'
Akkordarbeit is a program for formatting simple leadsheets in a
simplified ChordPro format to various other formats such as HTML
or plaintext.
  HERE

    LICENSE = 'MIT X11 License (see LICENSE.rdoc)'

    FEATUREDIR = 'features'
    FEATURES = %w[
      html_formatter.feature
      parser.feature
      text_formatter.feature
      step_definitions/akkordarbeit_steps.rb
    ]
    FEATUREFILES = FEATURES.map { |f| File.join FEATUREDIR, f }

    SPECDIR = 'spec'
    SPECS = %w[
      akkordarbeit_spec.rb
      akkordarbeit_suite.rb
      spec_helper.rb
    ]
    SPECFILES = SPECS.map { |f| File.join SPECDIR, f } << '.rspec'

    TESTFILES = FEATUREFILES + SPECFILES

    DOCFILES = %w[
      LICENSE.rdoc
      README.rdoc
      examples/README.rdoc
    ]

    SOURCEDIR = 'lib'
    SOURCES = %w[
      akkordarbeit.rb
      akkordarbeit/html_formatter.rb
      akkordarbeit/parser.rb
      akkordarbeit/text_formatter.rb
    ]
    SOURCEFILES = SOURCES.map { |f| File.join SOURCEDIR, f }

    EXECUTABLEDIR = 'bin'
    EXECUTABLES = %w[
      akkordarbeit
    ]
    EXECUTABLEFILES = EXECUTABLES.map { |f| File.join EXECUTABLEDIR, f }

    RDOCFILES = DOCFILES + EXECUTABLEFILES + SOURCEFILES
    RDOCOPTIONS = %w[--all --charset=UTF-8 --line-numbers --webcvs=https://GitHub.Com/JoergWMittag/Akkordarbeit/blob/master/%s]

    FILELIST = TESTFILES + RDOCFILES

    GEMSPEC = Gem::Specification.new do |s|
      s.name = NAME.downcase
      s.summary = SUMMARY
      s.version = Gem::Version.new VERSION
      s.authors = AUTHORS
      s.email = EMAIL
      s.homepage = HOMEPAGE
      s.license = LICENSE
      s.required_ruby_version = '~> 1.9.2'
      s.required_rubygems_version = '~> 1.4.0'
      s.has_rdoc = 'yard'
      s.rdoc_options = RDOCOPTIONS
      s.extra_rdoc_files = DOCFILES
      s.files = FILELIST
      s.test_files = TESTFILES
      s.executables = EXECUTABLES
      s.description = DESCRIPTION
      s.add_development_dependency 'cucumber', '~> 0.10.0'
      s.add_development_dependency 'metric_fu', '~> 2.0.1'
      s.add_development_dependency 'rspec', '~> 2.3.1'
      s.add_development_dependency 'yard', '~> 0.6.4'
    end
  end
end unless defined? Akkordarbeit::Projectinfo::GEMSPEC

if __FILE__ == $0
  Gem.manage_gems
  Gem::Builder.new(Akkordarbeit::Projectinfo::GEMSPEC).build
end
