require 'radrails'
# FIXME This won't work as is, I assume
command 'Tidy' do |cmd|
  cmd.key_binding = 'CONTROL+M2+H'
  cmd.scope = 'text.xml'
  cmd.output = :replace_selection
  cmd.input = :selection
  cmd.invoke =<<-EOF
if [[ "$TM_SOFT_TABS" = "YES" ]];
	then export XMLLINT_INDENT=`ruby -e"print(' ' * ${TM_TAB_SIZE})"`
	else export XMLLINT_INDENT=$'\t'
fi
result=`xmllint --format - 2>&1`
if [[ $? > 0 ]];
	then exit_show_tool_tip "Errors: $result"
	else echo "$result"
fi
EOF
end
