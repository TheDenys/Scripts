@rem ------------------ this is a beginning of rundump.bat batch file
@ECHO OFF

SET LOGFILE=batch.log
date /t >> %LOGFILE%
time /t >> %LOGFILE%
SET PDEXE=procdump.exe
SET PDCALL=%PDEXE% -accepteula -ma

IF NOT EXIST %PDEXE% ( 
    echo Can't find procdump.exe in current folder. Copy it next to this batch file.
    @echo no %PDEXE% > %LOGFILE%
    goto :eof
)

echo %PDEXE% is present.
echo Getting the memory dumps:

@rem ---Gathering dumps for SW processes: SWIS v2, BL, w3wp

CALL :getdumpBySvcName SWInfoServiceSvc
CALL :getdumpBySvcName OrionModuleEngine
CALL :getdumpByExeName w3wp.exe

goto :eof

:getdumpBySvcName
SETLOCAL
set SVCNAME=%1
set TLCOMMAND=tasklist /SVC /FI "SERVICES eq %SVCNAME%" /NH  /FO TABLE
rem @echo TLCOMMAND="%TLCOMMAND%"
FOR /f "usebackq tokens=2" %%G IN (`%TLCOMMAND%`) DO (
    echo %SVCNAME% is hosted in process with PID [%%G]
    @echo %SVCNAME% is hosted in process with PID [%%G] >> %LOGFILE%
    start %PDCALL% %%G
)
ENDLOCAL
goto :eof

:getdumpByExeName
SETLOCAL
set IMGNAME=%1
set TLCOMMAND=tasklist /SVC /FI "IMAGENAME eq %IMGNAME%" /NH  /FO TABLE
rem @echo TLCOMMAND="%TLCOMMAND%"
FOR /f "usebackq tokens=2" %%G IN (`%TLCOMMAND%`) DO (
    echo %IMGNAME% has PID [%%G]
    @echo %IMGNAME% is hosted in process with PID [%%G] >> %LOGFILE%
    start %PDCALL% %%G
)
ENDLOCAL
goto :eof
@rem ------------------ this is the end of rundump.bat batch file