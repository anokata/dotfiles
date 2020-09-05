REM Автозапуск telegram на втором раб столе
vdesk create
d:\progs\vdesk\VDesk.exe on:2 noswitch:true run:"D:\progs\TelegramDesktop\Telegram.exe"
REM Автозапуск vim with doc on 3
vdesk create
d:\progs\vdesk\VDesk.exe on:3 noswitch:true run:"D:\progs\Vim\vim82\gvim.exe"
d:\progs\vdesk\VDesk.exe on:3 noswitch:true run:"D:\progs\Far\Far.exe"