netsh wlan stop hostednetwork
netsh wlan set hostednetwork mode=allow ssid="Ksihenet" key="wa8va128" keyUsage=persistent
netsh wlan start hostednetwork
pause
