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