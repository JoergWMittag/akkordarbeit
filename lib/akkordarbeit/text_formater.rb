# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2009 Marc Rummel
#This code is licensed under the terms of the MIT License (see LICENSE.txt)

libdir = File.expand_path(File.dirname __FILE__).gsub(/(.*lib).*?/, '\1')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

module Akkordarbeit

  class TextFormater

    def format(parsetree)
      output = ""
      parsetree.each do |section|
        section.each do |line|
          chords, lyrics = "", ""
          line.each do |token|
            regex = /(\[.*?\])/
            if regex.match(token)
              chords << token
            else
              lyrics << token
              chords << " " * (lyrics.length - chords.length)
            end
          end
          output << chords.rstrip << "\n" << lyrics.rstrip << "\n"
        end
        output << "\n"
      end
      output
    end

  end

end
