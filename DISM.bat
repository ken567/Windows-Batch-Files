DISM /Online /Cleanup-Image /StartComponentCleanup
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /Scanhealth
DISM /Online /Cleanup-Image /RestoreHealth

cd  /d %userprofile%\Desktop

DEL /F /S /Q "DISM.bat"

exit