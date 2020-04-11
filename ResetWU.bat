net stop bits
net stop wuauserv
net stop appidsvc
net stop cryptsvc

taskkill /im wuauclt.exe /f

del /s /q /f "%allusersprofile%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"
del /s /q /f "%allusersprofile%\Microsoft\Network\Downloader\qmgr*.dat"

cd /d %SYSTEMROOT%

if exist "%SYSTEMROOT%\winsxs\pending.xml.bak" (
	del /s /q /f "%SYSTEMROOT%\winsxs\pending.xml.bak"
)
if exist "%SYSTEMROOT%\SoftwareDistribution.bak" (
	rmdir /s /q "%SYSTEMROOT%\SoftwareDistribution.bak"
)
if exist "%SYSTEMROOT%\system32\Catroot2.bak" (
	rmdir /s /q "%SYSTEMROOT%\system32\Catroot2.bak"
)
if exist "%SYSTEMROOT%\WindowsUpdate.log.bak" (
	del /s /q /f "%SYSTEMROOT%\WindowsUpdate.log.bak"

	
if exist "%SYSTEMROOT%\winsxs\pending.xml" (
	takeown /f "%SYSTEMROOT%\winsxs\pending.xml"
	attrib -r -s -h /s /d "%SYSTEMROOT%\winsxs\pending.xml"
	ren "%SYSTEMROOT%\winsxs\pending.xml" pending.xml.bak
)
if exist "%SYSTEMROOT%\SoftwareDistribution" (
	attrib -r -s -h /s /d "%SYSTEMROOT%\SoftwareDistribution"
	ren "%SYSTEMROOT%\SoftwareDistribution" SoftwareDistribution.bak
)
if exist "%SYSTEMROOT%\system32\Catroot2" (
	attrib -r -s -h /s /d "%SYSTEMROOT%\system32\Catroot2"
	ren "%SYSTEMROOT%\system32\Catroot2" Catroot2.bak
)
if exist "%SYSTEMROOT%\WindowsUpdate.log" (
	attrib -r -s -h /s /d "%SYSTEMROOT%\WindowsUpdate.log"
	ren "%SYSTEMROOT%\WindowsUpdate.log" WindowsUpdate.log.bak
)

sc.exe sdset wuauserv D:(A;;CCLCSWLOCRRC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLCRSDRCWDWO;;;SO)(A;;CCLCSWRPWPDTLOCRRC;;;SY)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;WD)
sc.exe sdset bits D:(A;;CCLCSWLOCRRC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLCRSDRCWDWO;;;SO)(A;;CCLCSWRPWPDTLOCRRC;;;SY)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;WD)
sc.exe sdset cryptsvc D:(A;;CCLCSWLOCRRC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLCRSDRCWDWO;;;SO)(A;;CCLCSWRPWPDTLOCRRC;;;SY)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;WD)
sc.exe sdset trustedinstaller D:(A;;CCLCSWLOCRRC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLCRSDRCWDWO;;;SO)(A;;CCLCSWRPWPDTLOCRRC;;;SY)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;WD)

cd /d %SYSTEMROOT%\system32

regsvr32.exe /s atl.dll
regsvr32.exe /s urlmon.dll
regsvr32.exe /s mshtml.dll
regsvr32.exe /s shdocvw.dll
regsvr32.exe /s browseui.dll
regsvr32.exe /s jscript.dll
regsvr32.exe /s vbscript.dll
regsvr32.exe /s scrrun.dll
regsvr32.exe /s msxml.dll
regsvr32.exe /s msxml3.dll
regsvr32.exe /s msxml6.dll
regsvr32.exe /s actxprxy.dll
regsvr32.exe /s softpub.dll
regsvr32.exe /s wintrust.dll
regsvr32.exe /s dssenh.dll
regsvr32.exe /s rsaenh.dll
regsvr32.exe /s gpkcsp.dll
regsvr32.exe /s sccbase.dll
regsvr32.exe /s slbcsp.dll
regsvr32.exe /s cryptdlg.dll
regsvr32.exe /s oleaut32.dll
regsvr32.exe /s ole32.dll
regsvr32.exe /s shell32.dll
regsvr32.exe /s initpki.dll
regsvr32.exe /s wuapi.dll
regsvr32.exe /s wuaueng.dll
regsvr32.exe /s wuaueng1.dll
regsvr32.exe /s wucltui.dll
regsvr32.exe /s wups.dll
regsvr32.exe /s wups2.dll
regsvr32.exe /s wuweb.dll
regsvr32.exe /s qmgr.dll
regsvr32.exe /s qmgrprxy.dll
regsvr32.exe /s wucltux.dll
regsvr32.exe /s muweb.dll
regsvr32.exe /s wuwebv.dll

netsh winsock reset
netsh winhttp reset proxy

sc.exe config wuauserv start= auto
sc.exe config bits start= delayed-auto
sc.exe config cryptsvc start= auto
sc.exe config TrustedInstaller start= demand
sc.exe config DcomLaunch start= auto

net start bits
net start wuauserv
net start appidsvc
net start cryptsvc
net start DcomLaunch

cd /d %userprofile%/Desktop

del /f /s /q ResetWU.bat






