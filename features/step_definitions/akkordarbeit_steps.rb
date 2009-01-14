#!/usr/bin/env ruby
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

begin require 'rubygems'; rescue LoadError
else begin gem 'rspec', '~> 1.1.11'; rescue Gem::LoadError; end end
require 'spec/expectations'

stepsdir = File.expand_path(File.dirname __FILE__).gsub(/(.*step_definitions).*?/, '\1')
$LOAD_PATH.unshift stepsdir unless $LOAD_PATH.include? stepsdir

featuredir = File.expand_path(stepsdir).gsub(/(.*features).*?/, '\1')
$LOAD_PATH.unshift featuredir unless $LOAD_PATH.include? featuredir

libdir = File.expand_path File.join(featuredir, '..', 'lib')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

require 'akkordarbeit'

Before do
  @calc = Demo::Calculator.new
end
 
Given "I have entered $n into the calculator" do |n|
  @calc.push n.to_i
end
 
When /I press add/ do
  @result = @calc.Add
end
 
Then /the result should be (.*) on the screen/ do |result|
  @result.should == result.to_i
end
 
Then /the result class should be (\w*)/ do |class_name|
  @result.class.name.should == class_name
end
