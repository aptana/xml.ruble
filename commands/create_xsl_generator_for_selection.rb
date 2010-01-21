require 'radrails'
require 'rexml/document'

def serialize(source, dest)
  if source.is_a? REXML::Text
    dest.add_text(source.dup)
    return dest
  end

  d2 = dest.add_element('xsl:element', 'name' => source.expanded_name)
  source.attributes.each { |(k,v)| d2.add_element('xsl:attribute', 'name' => k).text = v }
  source.children.each { |node| serialize(node, d2)}
  dest
end

command 'Create XSL Generator for Selection' do |cmd|
  cmd.scope = 'text.xml'
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke do
    source = REXML::Document.new(STDIN.read)
    dest   = REXML::Document.new
    
    print serialize(source.elements[1], dest).to_s
  end
end
