
sfc /scannow

findstr /c:"[SR]" %windir%\Logs\CBS\CBS.log >"%userprofile%\Desktop\sfcdetails.txt"
	
cd /d %userprofile%\Desktop

DEL /f /s /q "sfcScannow.bat"