#!/usr/bin/env ruby
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+Akkordarbeit@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

specdir = File.expand_path(File.dirname __FILE__).gsub(/(.*spec).*?/, '\1')
$LOAD_PATH.unshift specdir unless $LOAD_PATH.include? specdir

require 'spec_helper'

Dir[File.join specdir, '**', '*_spec.rb'].each { |spec| require spec }
