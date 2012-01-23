require 'ruble'

with_defaults :scope => 'text.xml' do
  snippet 'CDATA' do |s|
    s.trigger = 'cdata'
    s.expansion = '<![CDATA[$0]]>'
  end
  
  snippet t(:long_attribute_tag) do |s|
    s.trigger = '<a'
    s.expansion = '<${1:name} ${2:attr="value"}>$0
</${1:name}>'
  end
  
  snippet t(:long_tag) do |s|
    s.trigger = '<'
    s.expansion = '<${1:name}>$0</${1:name}>'
  end
  
  snippet t(:short_tag) do |s|
    s.trigger = '>'
    s.expansion = '<${1:name} />'
  end

  snippet t(:xml_processing_instruction) do |s|
    s.trigger = '<?xml'
    s.expansion = '<?xml version="1.0" encoding="UTF-8"?>'
  end
end
  
# snippet 'Special: Return Inside Empty Open/Close Tags' do |s|
  # FIXME This should probably be moved into the AutoIndentStrategy for XML Editor!
#  s.key_binding = '\n'
#  s.scope = 'meta.scope.between-tag-pair.xml'
#  s.expansion = '
# $0
#'
#end
