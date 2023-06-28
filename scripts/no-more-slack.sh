if pgrep "Slack" >/dev/null; then
	pkill 'Slack'
	hs -c "hs.alert('Quitting Slack because it is night time.')"
fi
