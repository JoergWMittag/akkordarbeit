# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

libdir = File.expand_path(File.dirname __FILE__).gsub(/(.*lib).*?/, '\1')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

require 'tagz'

module Akkordarbeit
  class HtmlFormatter
    include Tagz.globally
    def format(parsetree)
      #tagz << '<!DOCTYPE>'
      html_(:xmlns => 'http://www.w3.org/1999/xhtml', 'xml:lang' => :en, :lang => :en) {
        head_ {
          meta_! 'http-equiv' => 'Content-type', :content => 'text/html; charset=UTF-8'
          title_ { 'Song-Sheet' }
          meta_! 'http-equiv' => 'content-language', :content => :en
          style_ { 'p {
	line-height: 300%;
	max-width: 30em;
}
.chord {
	position: relative;
}
.chord span {
	position: absolute;
	bottom: 40%;
	font-size: 66%;
	font-weight: bold;
}
.chord .brackets {
	display: none;
}'
          }
        }
        body_ {
          header_ {
            h1_ { 'Song-Sheet' }
          }
          section_ {
            parsetree.each do |section|
              p_ {
                section.each do |line|
                  last_chord = nil
                  line.each do |token|
                    regex = /(?:\[(.*?)\])/
                    if regex.match(token)
                      last_chord = $1
                    else
                      unless last_chord
                        tagz << token
                      else
                        token = ' ' if token =~ /^\s$/
                        span_(:class => :chord) {
                          span_ {
                            span_(:class => :brackets) { '[' }
                            tagz << last_chord
                            span_(:class => :brackets) { ']' }
                          }
                          tagz << token
                        }
                        last_chord = nil
                      end
                    end
                  end
                  br_!
                end
              }
            end
          }
        }
      }
    end
  end
end
