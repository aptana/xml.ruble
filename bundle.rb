require 'java'
require 'ruble'

bundle do |bundle|
  bundle.author = 'Christopher Williams'
  bundle.copyright = "© Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.display_name = "XML"
  bundle.description =  <<END
A port of the TextMate bundle that provides support for the <a href="http://www.w3.org/XML/">eXtensible Markup Language</a>.
END
  bundle.repository = "git://github.com/aptana/xml.ruble.git"

  # Indentation
  increase_indent_pattern = /^\s*<(([^!\/?]|%)(?!.+?([\/%]>|<\/.+?>))|[%!]--\s*$)/
  decrease_indent_pattern = /^\s*(<\/[^>]+>|-->|--%>)/
  bundle.indent["text.xml"] = increase_indent_pattern, decrease_indent_pattern

  # Set up folding. Folding is now done in Java code for this language  
  # XML Folding
  # folding_start_marker = /^\s*(<[^!?%\/](?!.+?(\/>|<\/.+?>))|<[!%]--(?!.+?--%?>)|<%[!]?(?!.+?%>))/
  # folding_stop_marker = /^\s*(<\/[^>]+>|[\/%]>|-->)\s*$/
  #bundle.folding["text.xml"] = folding_start_marker, folding_stop_marker
  # XSL Folding
  # start_folding = /^\s*(<[^!?%\/](?!.+?(\/>|<\/.+?>))|<[!%]--(?!.+?--%?>)|<%[!]?(?!.+?%>))/
  # end_folding = /^\s*(<\/[^>]+>|[\/%]>|-->)\s*$/
  # bundle.folding['text.xml.xsl'] = start_folding, end_folding
  
  # File types
  bundle.file_types['text.xml'] = '*.xml', '*.tld', '*.jsp', '*.pt', '*.cpt', '*.dtml', '*.rss', '*.opml'
  bundle.file_types['text.xml.xsl'] = '*.xsl', '*.xslt'
  
  bundle.menu 'XML' do |main_menu|
    main_menu.command 'Validate Syntax'
    main_menu.command 'Tidy'
    main_menu.command 'Create XSL Generator for Selection'
    main_menu.separator
    main_menu.command 'Long Tag'
    main_menu.command 'Long Attribute Tag'
    main_menu.command 'Short Tag'
  end
end

# add special ENV vars
env "text.xml" do |e|
  e['TM_COMMENT_START'] = "<!-- "
  e['TM_COMMENT_END'] = " -->"
end