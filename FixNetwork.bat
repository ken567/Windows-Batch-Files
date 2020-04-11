netsh winsock reset
netsh int ip reset
netsh interface ipv4 reset
netsh interface ipv6 reset
netsh interface tcp reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
arp -d *

cd  /d %userprofile%\Desktop

DEL /F /S "FixNetwork.bat"

shutdown /r /t 0

