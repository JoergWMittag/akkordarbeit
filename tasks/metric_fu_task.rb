# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# Copyright (c) 2009 Marc Rummel <mailto:Marc.Rummel+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

require 'rake'
require 'metric_fu'

MetricFu::Configuration.run do |config|
  config.coverage[:rcov_opts].delete_if { |option| option.include? 'rails' }
  config.saikuro  = { "--warn_cyclo" => "3", "--error_cyclo" => "4" }
end