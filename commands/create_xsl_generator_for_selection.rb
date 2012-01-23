require 'ruble'

command t(:create_xsl_generator) do |cmd|
  cmd.scope = 'text.xml'
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke do
    require 'rexml/document'
    require 'serialize_xml'
    
    source = REXML::Document.new($stdin.read)
    dest   = REXML::Document.new
    
    print serialize(source.elements[1], dest).to_s
  end
end
