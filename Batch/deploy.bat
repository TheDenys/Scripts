@set CUR_DIR=%CD%
@set SOURCE_FOLDER=D:\WORK\batch\folder\0\0
@set TARGET_FOLDER=D:\WORK\batch\folder\0\1
@cd "%TARGET_FOLDER%"
@FOR /D %%I in (*) DO @(
    @rmdir /s /q "%%~fI" || (
        @echo can't delete folder [%%~fI]
        goto :END
    )
    @echo deleted folder:[%%~fI]    
)

@FOR %%I in (*) DO @(
    IF /I "%%I" EQU "web.config" (
        echo web.config ne trogaem
    ) ELSE (
        @del /f /q "%%~fI" || (
            @echo can't delete file [%%~fI]
            goto :END
        )
        @echo deleted file:[%%~fI]
    )
)

xcopy /E /H /R /Y "%SOURCE_FOLDER%" "%TARGET_FOLDER%" /EXCLUDE:%CUR_DIR%\excludes.txt


:END
@cd %CUR_DIR%