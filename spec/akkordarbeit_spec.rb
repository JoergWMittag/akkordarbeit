#!/usr/bin/env ruby
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+Akkordarbeit@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

require File.expand_path File.join(File.dirname(__FILE__), 'spec_helper')

require 'akkordarbeit'

describe "The 'and' operator" do
  it 'short-circuits evaluation at the first condition to be false' do
    x = nil
    true.and { false.and { x = 1 } }
    x.must_be_nil
  end

  it 'evaluates to the first condition not to be true' do
    (:yes.and { 1.and { nil.and { true } } }).must_be_nil
    (:yes.and { 1.and { false.and { true } } }).must_equal false
  end

  it 'evaluates to the last condition if all are true' do
    (:yes.and { 1 }).must_equal 1
    (1.and { :yes }).must_equal :yes
  end

  it 'evaluates the full set of chained conditions during assignment' do
    x, y = nil
    x = 1.and { y = 2 }
    # "1 && y = 2" is evaluated and then assigned to x
    x.must_equal 2
  end

  it 'when used in assignment, evaluates and assigns expressions individually' do
    x, y = nil
    (x = 1).and { y = 2 }
    # evaluates (x=1) and (y=2)
    x.must_equal 1
  end
end
