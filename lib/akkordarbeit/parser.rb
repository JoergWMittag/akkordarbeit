# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Jörg W Mittag <JoergWMittag+Akkordarbeit@GoogleMail.Com>
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

libdir = File.expand_path(File.dirname __FILE__).gsub(/(.*lib).*?/, '\1')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

module Akkordarbeit
  class Parser
    def parse(songstr)
      chordpattern = /(\[.*?\])/
      seperatorpattern = /\n\n+/
      song = []
      songstr.split(seperatorpattern).each do |sectionstr|
        section = []
        sectionstr.each_line do |line|
          section << line.chomp.split(chordpattern).reject { |str| str.empty?  }
        end
        song << section
      end
      song
    end
  end
end
