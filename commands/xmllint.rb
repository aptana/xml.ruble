require 'ruble'
# FIXME This won't work on windows
command t(:validate_syntax) do |cmd|
  cmd.key_binding = 'CONTROL+M2+V'
  cmd.scope = 'text.xml'
  cmd.output = :show_as_html
  cmd.input = :document
  cmd.invoke.windows = ""
  # FIXME The links aren't getting generated and wouldn't work for our editor anyways right now...
  cmd.invoke =<<-EOF
xmllint --htmlout --valid - 2>&1|perl -pe 's|^((?:</?[^>]+>)*)(.*?):(\d+):(.*error.*)|$1<a href="txmt://open?line=$3">$4</a>|'
EOF
end
