require 'ruble'

bundle do |bundle|
  bundle.author = 'Christopher Williams'
  bundle.copyright = "Copyright 2012 Aptana Inc. Distributed under the MIT license."
  bundle.display_name = t(:bundle_name)
  bundle.description = 'A port of the TextMate bundle that provides support for the <a href="http://www.w3.org/XML/">eXtensible Markup Language</a>.'
  bundle.repository = "git://github.com/aptana/xml.ruble.git"

  # Indentation
  increase_indent_pattern = /^\s*<(([^!\/?]|%)(?!.+?([\/%]>|<\/.+?>))|[%!]--\s*$)/
  decrease_indent_pattern = /^\s*(<\/[^>]+>|-->|--%>)/
  bundle.indent["text.xml"] = increase_indent_pattern, decrease_indent_pattern
  
  # File types
  bundle.file_types['text.xml'] = '*.xml', '*.tld', '*.jsp', '*.pt', '*.cpt', '*.dtml', '*.rss', '*.opml'
  bundle.file_types['text.xml.xsl'] = '*.xsl', '*.xslt'
  
  bundle.menu t(:bundle_name) do |main_menu|
    main_menu.command t(:validate_syntax)
    main_menu.command t(:tidy)
    main_menu.command t(:create_xsl_generator)
    main_menu.separator
    main_menu.command t(:long_tag)
    main_menu.command t(:long_attribute_tag)
    main_menu.command t(:short_tag)
  end
end

# add special ENV vars
env "text.xml" do |e|
  e['TM_COMMENT_START'] = "<!-- "
  e['TM_COMMENT_END'] = " -->"
end

# Smart character pairs
smart_typing_pairs["text.xml"] = ['<', '>']
smart_typing_pairs["text.xml meta.tag - punctuation.definition.tag.begin"] = ['"', '"', "'", "'"]
