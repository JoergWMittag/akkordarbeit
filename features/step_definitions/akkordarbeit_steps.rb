#!/usr/bin/env ruby
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

begin require 'rubygems'; rescue LoadError
else begin gem 'rspec', '~> 1.1.11'; rescue Gem::LoadError; end end
require 'spec/expectations'

stepsdir = File.expand_path(File.dirname __FILE__).gsub(/(.*step_definitions).*?/, '\1')
$LOAD_PATH.unshift stepsdir unless $LOAD_PATH.include? stepsdir

featuredir = File.expand_path File.join(stepsdir, '..')
$LOAD_PATH.unshift featuredir unless $LOAD_PATH.include? featuredir

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
  @text_formater = Akkordarbeit::TextFormater.new
end

Given 'the parsetree' do |parsetree|
  @parsetree = eval(parsetree)
end

When 'I format it' do
  @result = @text_formater.format @parsetree
end

Then 'the output should be' do |output|
  @result.should == output
end