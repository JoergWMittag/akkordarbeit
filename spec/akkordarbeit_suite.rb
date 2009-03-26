# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# Copyright (c) 2009 Marc Rummel <mailto:Marc.Rummel+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

specdir = File.expand_path(File.dirname __FILE__).gsub(/(.*spec).*?/, '\1')
$LOAD_PATH.unshift specdir unless $LOAD_PATH.include? specdir

require 'spec_helper'

Dir[File.join specdir, '**', '*_spec.rb'].each { |spec| require spec }
