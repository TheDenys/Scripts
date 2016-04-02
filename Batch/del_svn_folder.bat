@set CUR_DIR=%CD%
@set TARGET=%1%
@FOR /R %TARGET% %%I in (.) DO @(
    @rem cd /d %%I
    @if exist "%%~fI\.svn" (
        echo svn found in folder:[%%~fI]
        rmdir /s /q "%%~fI\.svn"
    )
)
@cd /d %CUR_DIR%
@pause