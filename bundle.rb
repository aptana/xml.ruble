require 'java'
require 'ruble'

bundle 'XML' do |bundle|
  bundle.author = 'Allan Odgaard'
  bundle.contact_email_rot_13 = 'gz-ohaqyrf@znpebzngrf.pbz'
  bundle.description =  <<END
Support for the <a href="http://www.w3.org/XML/">eXtensible Markup Language</a>.
END
  bundle.repository = "git://github.com/aptana/xml.ruble.git"
  
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