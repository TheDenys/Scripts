@ECHO OFF

ECHO Stopping instance ...
logman stop orionPerfMon
ECHO Removing instance ...
logman delete orionPerfMon

ECHO.
ECHO.
ECHO.
pause