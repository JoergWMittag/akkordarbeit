# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# Copyright (c) 2009 Marc Rummel <mailto:Marc.Rummel+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

require 'cucumber'
require 'spec/expectations'

stepsdir = File.expand_path(File.dirname __FILE__).gsub(/(.*step_definitions).*?/, '\1')
featuredir = File.expand_path File.join(stepsdir, '..')
libdir = File.expand_path File.join(featuredir, '..', 'lib')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

require 'akkordarbeit'

Before do
  @parser = Akkordarbeit::Parser.new
end

Given 'the song' do |song|
  @song = song
end

When 'I parse it' do
  @result = @parser.parse @song
end

Then 'the parsetree should be' do |parsetree|
  @result.should == eval(parsetree)
end

Before do
  @text_formatter = Akkordarbeit::TextFormatter.new
  @html_formatter = Akkordarbeit::HtmlFormatter.new
end

Given 'the parsetree' do |parsetree|
  @parsetree = eval(parsetree)
end

When 'I format it as (.*)' do |format|
  @result = case format
  when /html/i
    @html_formatter.format @parsetree
  when /text/i
    @text_formatter.format @parsetree
  end
end

Then 'the output should be' do |output|
  @result.should == output
end
