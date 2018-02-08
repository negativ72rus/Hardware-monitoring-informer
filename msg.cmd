@echo off 
rem nircmdc cmdwait 2000 savescreenshot shot.png
rem i_view64.exe /capture=2 /convert=shot.png
rem screenshot-cmd.exe -wt "~/tg" -o shot.png

set TG_USERNAME=@username
screenshot-cmd.exe -o shot.png
rem -wt "Мониторинг MSI Afterburner v4.3.0" 

set TELEGRAM_CONFIG_DIR=.telegram-cli
set TELEGRAM_HOME=%~dp0
del message.txt /q
del message2.txt /q
del message3.txt /q

echo send_photo %TG_USERNAME% shot.png "[%USERDOMAIN%] %DATE% %TIME%">> message.txt
echo send_text %TG_USERNAME% test.txt>> message2.txt
echo send_text %TG_USERNAME% CPU.txt>> message3.txt

(echo dialog_list
timeout /t 3 > nul
type message.txt, message2.txt, message3.txt
echo.
echo safe_quit
) | telegram-cli.exe --disable-readline

