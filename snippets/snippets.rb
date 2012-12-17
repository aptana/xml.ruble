require 'ruble'

with_defaults :scope => 'text.xml' do
  snippet 'CDATA' do |s|
    s.trigger = 'cdata'
    s.expansion = '<![CDATA[$0]]>'
  end
  
  command t(:long_attribute_tag) do |cmd|
    cmd.output = :insert_as_snippet
    cmd.trigger = '<a'
    cmd.invoke do |context|
      expansion = '<${1:name} ${2:attr="value"}>$0
</${1:name}'
      next_char = context.editor.document.get(context.editor.caret_offset, 1)
      expansion += ">" unless next_char == ">"
      expansion
    end
  end
  
  command t(:long_tag) do |cmd|
    cmd.trigger = '<'
    cmd.output = :insert_as_snippet
    cmd.invoke do |context|
      expansion = '<${1:name}>$0</${1:name}'
      next_char = context.editor.document.get(context.editor.caret_offset, 1)
      expansion += ">" unless next_char == ">"
      expansion
    end
  end
  
  snippet t(:short_tag) do |s|
    s.trigger = '>'
    s.expansion = '<${1:name} />'
  end

  command t(:xml_processing_instruction) do |cmd|
    cmd.trigger = '<?xml'
    cmd.output = :insert_as_snippet
    cmd.invoke do |context|
      expansion = '<?xml version="1.0" encoding="UTF-8"?'
      next_char = context.editor.document.get(context.editor.caret_offset, 1)
      expansion += ">" unless next_char == ">"
      expansion
    end
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
