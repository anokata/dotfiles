tint2& #get pid $!
PANEL=$!
sleep 10
skype-call-recorder&
skype 2>/dev/null 1>/dev/null&
echo 'wait'
sleep 30 && echo 'kill tint' && kill $PANEL
