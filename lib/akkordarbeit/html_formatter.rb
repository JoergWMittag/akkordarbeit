# vim: fileencoding=UTF-8 ft=ruby syn=ruby ts=2 sw=2 ai eol et si

# Copyright (c) 2009 Jörg W Mittag <mailto:JoergWMittag+Akkordarbeit@GoogleMail.Com>
# This code is licensed under the terms of the MIT License (see LICENSE.rdoc)

libdir = File.expand_path(File.dirname __FILE__).gsub(/(.*lib).*?/, '\1')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include? libdir

require 'cgi'

module Akkordarbeit
  class HtmlFormatter
    def format(parsetree)
      output =  <<-'HERE'
<!DOCTYPE html>
<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'>
	<head>
		<meta http-equiv='Content-type'     content='text/html; charset=UTF-8' />
		<title>Song-Sheet</title>
		<meta http-equiv='content-language' content='en' />
		<style>
			p {
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
			}
		</style>
	</head>
	<body>
		<header>
			<h1>Song-Sheet</h1>
		</header>
		<section>
      HERE
      parsetree.each do |section|
        output << "\t"*3 << "<p>\n"
        section.each do |line|
          output << "\t"*4
          last_chord = nil
          line.each do |token|
            regex = /(?:\[(.*?)\])/
            if regex.match(token)
              last_chord = $1
            else
              unless last_chord
                output << escape(token)
              else
                token = '&nbsp;' if token =~ /^\s$/
                output << "<span class='chord'><span><span class='brackets'>[</span>#{escape(last_chord)}<span class='brackets'>]</span></span>#{escape(token)}</span>"
                last_chord = nil
              end
            end
          end
          output << "<br />\n"
        end
        output << "\t"*3 << "</p>\n"
      end
      return output << <<-'HERE'
		</section>
	</body>
</html>
    HERE
    end

    private

    def escape(str)
      return CGI.escapeHTML(str)
    end
  end
end
