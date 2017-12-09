@echo off

set _outputpath=c:\perfCounter\
set sample=00:00:02
set maxfile=100
set maxtime=24:00:00

ECHO **************************************
ECHO *  Record performance counters       *
ECHO    OutputDir: %_outputpath%          
ECHO    Sample interval: %sample%         
ECHO    Max log size:    %maxfile% MB     
ECHO    Max time to live:%maxtime%
ECHO *                                    *
ECHO **************************************

 
ECHO Stopping previous instance ....
logman stop ACMESetOfCounters
ECHO Deleting previous instance ....
logman delete ACMESetOfCounters

ECHO.
ECHO Creating and starting new instance ....
logman create counter ACMESetOfCounters -cf perfcounters.config -f csv -max %maxfile% -si %sample% -rf %maxtime% -o "%_outputpath%PerfCnt_%computername%_" 
rem ECHO Starting instance just to be sure, on W2008 is not instance started automatically with previous command ....
logman start ACMESetOfCounters >> NUL

ECHO.
ECHO.
ECHO All operation done!
pause