require 'java'
require 'ruble'

bundle 'XML' do |bundle|
  bundle.author = 'Christopher Williams'
  bundle.copyright = "© Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.description =  <<END
A port of the TextMate bundle that provides support for the <a href="http://www.w3.org/XML/">eXtensible Markup Language</a>.
END
  bundle.repository = "git://github.com/aptana/xml.ruble.git"

  # Indentation
  increase_indent_pattern = /^\s*<(([^!\/?]|%)(?!.+?([\/%]>|<\/.+?>))|[%!]--\s*$)/
  decrease_indent_pattern = /^\s*(<\/[^>]+>|-->|--%>)/
  bundle.indent["text.xml"] = increase_indent_pattern, decrease_indent_pattern
  
  # XML Folding
  folding_start_marker = /^\s*(<[^!?%\/](?!.+?(\/>|<\/.+?>))|<[!%]--(?!.+?--%?>)|<%[!]?(?!.+?%>))/
  folding_stop_marker = /^\s*(<\/[^>]+>|[\/%]>|-->)\s*$/
  bundle.folding["text.xml"] = folding_start_marker, folding_stop_marker
  # XSL Folding
  start_folding = /^\s*(<[^!?%\/](?!.+?(\/>|<\/.+?>))|<[!%]--(?!.+?--%?>)|<%[!]?(?!.+?%>))/
  end_folding = /^\s*(<\/[^>]+>|[\/%]>|-->)\s*$/
  bundle.folding['text.xml.xsl'] = start_folding, end_folding
  
  # File types
  bundle.register_file_type('*.xml', 'text.xml')
  bundle.register_file_type('*.tld', 'text.xml')
  bundle.register_file_type('*.jsp', 'text.xml')
  bundle.register_file_type('*.pt', 'text.xml')
  bundle.register_file_type('*.cpt', 'text.xml')
  bundle.register_file_type('*.dtml', 'text.xml')
  bundle.register_file_type('*.rss', 'text.xml')
  bundle.register_file_type('*.opml', 'text.xml')
  bundle.register_file_type('*.xsl', 'text.xml.xsl')
  bundle.register_file_type('*.xslt', 'text.xml.xsl')
  
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

# Extend Ruble::Editor to add special ENV vars
module Ruble
  class Editor
    unless method_defined?(:to_env_pre_xml_bundle)
      alias :to_env_pre_xml_bundle :to_env
      def to_env
        env_hash = to_env_pre_xml_bundle
        scopes = current_scope.split(' ')
        if !scopes.select {|scope| scope.start_with? "text.xml" }.empty?
          env_hash['TM_COMMENT_START'] = "<!-- "
          env_hash['TM_COMMENT_END'] = " -->"
        end
        env_hash
      end
    end
  end
end