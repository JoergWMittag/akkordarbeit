# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Marc Rummel <mailto:Marc.Rummel+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

libdir = File.expand_path(File.dirname __FILE__).gsub(/(.*lib).*?/, '\1')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

module Akkordarbeit
  class TextFormatter
    def format(parsetree)
      output = ''
      parsetree.each do |section|
        section.each do |line|
          chords, lyrics = '', ''
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
      return output
    end
  end
end
