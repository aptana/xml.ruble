require 'ruble'

template "XML Template" do |t|
  t.filetype = "*.xml"
  t.location = "templates/template.xml"
end

template "XSLT Template" do |t|
  t.filetype = "*.xsl"
  t.location = "templates/template.xsl"
end